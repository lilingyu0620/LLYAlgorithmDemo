### flv格式和seek原理

FLV（Flash Video）是Adobe公司设计开发的一种流行的流媒体格式，由于其视频文件体积轻巧、封装简单等特点，使其很适合在互联网上进行应用。此外，FLV可以使用Flash Player进行播放，而Flash Player插件已经安装在全世界绝大部分浏览器上，这使得通过网页播放FLV视频十分容易。目前主流的视频网站如优酷网，土豆网，乐视网等网站无一例外地使用了FLV格式。FLV封装格式的文件后缀通常为“.flv”。

### flv数据格式

从整个文件上开看,FLV是由The FLV header 和 The FLV File Body 组成.

#### FLV header

![](http://ofy1hyquv.bkt.clouddn.com/header.png)

Signature: FLV 文件的前3个字节为固定的‘F’‘L’‘V’,用来标识这个文件是flv格式的.在做格式探测的时候，

如果发现前3个字节为“FLV”，就认为它是flv文件.

Version: 第4个字节表示flv版本号.

Flags: 第5个字节中的第0位和第2位,分别表示 video 与 audio 存在的情况.(1表示存在,0表示不存在)

DataOffset : 最后4个字节表示FLV header 长度.

#### FLV File Body

![](http://ofy1hyquv.bkt.clouddn.com/body.png)

FLV File Body是由一连串的**Previous Tag Size** + tags构成.**Previous Tag Size**就是4个字节数据,表示前一个tag的size.

#### FLV Tag

FLV文件中的数据都是由一个个TAG组成,TAG里面的数据可能是video、audio、scripts.

![](http://ofy1hyquv.bkt.clouddn.com/tag2.png)

TagType: TAG中第1个字节中的前5位表示这个TAG中包含数据的类型,8 = audio,9 = video,18 = script data.

DataSize:StreamID之后的数据长度.

Timestamp和TimestampExtended组成了这个TAG 包数据的PTS信息,PTS= Timestamp | TimestampExtended << 24.

StreamID之后的数据就是每种格式的情况不一样了，接下格式进行详细的介绍.

#### Audio Tags

如果TAG包中的TagType==8时，就表示这个TAG是audio。

StreamID之后的数据就表示是AudioTagHeader，AudioTagHeader结构如下：

![](http://ofy1hyquv.bkt.clouddn.com/audiotagheader.png)

#### Video Tags

如果TAG包中的TagType==9时，就表示这个TAG是video.

StreamID之后的数据就表示是VideoTagHeader，VideoTagHeader结构如下：

![](http://ofy1hyquv.bkt.clouddn.com/videotagheader.png)

#### SCRIPTDATA(控制帧）

如果TAG包中的TagType==18时，就表示这个TAG是SCRIPT.

该类型Tag又通常被称为Metadata Tag，会放一些关于FLV视频和音频的元数据信息如：duration、width、height等。**通常该类型Tag会跟在File Header后面作为第一个Tag出现，而且只有一个。**

![](http://ofy1hyquv.bkt.clouddn.com/STD.png)

一般来说，该Tag Data结构包含两个AMF包。AMF（Action Message Format）是Adobe设计的一种通用数据封装格式，在Adobe的很多产品中应用，简单来说，AMF将不同类型的数据用统一的格式来描述。第一个AMF包封装字符串类型数据，用来装入一个“onMetaData”标志，这个标志与Adobe的一些API调用有，在此不细述。第二个AMF包封装一个数组类型，这个数组中包含了音视频信息项的名称和值。具体说明如下，大家可以参照图片上的数据进行理解。

第一个AMF包：
       第1个字节表示AMF包类型，一般总是0x02，表示字符串，其他值表示意义请查阅文档。
       第2-3个字节为UI16类型值，表示字符串的长度，一般总是0x000A（“onMetaData”长度）。
       后面字节为字符串数据，一般总为“onMetaData”。
 
第二个AMF包：
       第1个字节表示AMF包类型，一般总是0x08，表示数组。
       第2-5个字节为UI32类型值，表示数组元素的个数。
       后面即为各数组元素的封装，数组元素为元素名称和值组成的对。表示方法如下：
       第1-2个字节表示元素名称的长度，假设为L。
       后面跟着为长度为L的字符串。
       第L+3个字节表示元素值的类型。
       后面跟着为对应值，占用字节数取决于值的类型
       
#### onMetaData

onMetaData 是SCRIPTDATA中对我们来说十分重要的信息，结构如下表：
![](http://ofy1hyquv.bkt.clouddn.com/onMetaData.png)

这里面的duration、filesize、视频的width、height等这些信息对我们来说很有用.

### metadata和yamdi,flvtool2(ruby),FLVMDI(非开源)

yamdi为flv文件增加了很多metadata信息，比如创建者、是否有关键帧、是否有视频、是否有音频，视频高度和宽度等等。而yamdi加入的meta数据中，最有效的要数关键帧。被注入了关键帧的flv可以实现像土豆网、优酷网等大型视频网站一样的“拖进度”，提前拖到缓冲还未加载到的位置开始播放。

#### keyframes

keyframes中包含着2个内容 'filepositions' and 'times'分别指的是关键帧的文件位置和关键帧的PTS.通过keyframes可以建立起自己的Index，然后再seek和快进快退的操作中，快速有效的跳转到你想要找的关键帧的位置进行处理。