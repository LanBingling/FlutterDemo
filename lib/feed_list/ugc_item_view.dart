import 'package:flutter/material.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_model.dart';

class UGCItem extends StatefulWidget {

  UGCItem(this.cardInfo);

  final CardInfo cardInfo;

  @override
  _UGCItemState createState() => _UGCItemState();
}

class _UGCItemState extends State<UGCItem> {

  /// UGC 大图
  Widget _getUGCCover() {
    return Stack(
      overflow: Overflow.visible, /// 超出父布局时怎么处理
      children: <Widget>[
        ClipRRect(
          child: Image.network(
            widget.cardInfo.feed_info.content.attachments[0].data.url/*'assets/images/ugc.jpg'*/,/*https://uploadbeta.com/api/pictures/random*/
            height: 250,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        Positioned(
          width: 50.0,
          height: 20.0,
          left: -2.0,
          bottom: -10.0,
          child: Image.asset(
            "assets/images/feed_tag.png",
          ),
        ),
      ],
    );
  }

  Widget _getUGCDesc() {
    if (widget.cardInfo.feed_info.content.title.length == 0) {
      return SizedBox(height: 12.0,);
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 12.0),
        child: Text(
          widget.cardInfo.feed_info.content.title,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          textDirection: TextDirection.ltr,
          /// 文字最大行数
          maxLines: 2,
          /// 文字显示不下时, 结尾显示 ...
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  }

  Widget _getUGCUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0, top: 3.0, right: 9.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            child: ClipOval(
              child: Image.network(
                widget.cardInfo.feed_info.user.avatar/*'https://uploadbeta.com/api/pictures/random/?key=%E6%8E%A8%E5%A5%B3%E9%83%8E'*/,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(width: 10.0,),
          Expanded(
            child: Text(
              widget.cardInfo.feed_info.user.nickname,
              style: TextStyle(
                fontSize: 13.0,
                color: Color.fromARGB(0xFF, 0x96, 0x96, 0x96),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.star_border,),
          Container(width: 5.0,),
          Text(
            '${widget.cardInfo.feed_info.like_num}',
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromARGB(0xFF, 0x96, 0x96, 0x96),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  /// 阴影xy轴偏移量
                  offset: Offset(0.5, 0.5),
                  /// 阴影模糊程度
                  blurRadius: 3.0,
                ),
                BoxShadow(color: Colors.grey[200], offset: Offset(-0.5, -0.5), blurRadius: 3.0),
                BoxShadow(color: Colors.grey[200], offset: Offset(0.5, -0.5), blurRadius: 3.0),
                BoxShadow(color: Colors.grey[200], offset: Offset(-0.5, 0.5), blurRadius: 3.0),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getUGCCover(),
                _getUGCDesc(),
                _getUGCUserInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
