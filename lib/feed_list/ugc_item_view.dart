import 'package:flutter/material.dart';

class UGCItem extends StatefulWidget {
  @override
  _UGCItemState createState() => _UGCItemState();
}

class _UGCItemState extends State<UGCItem> {

  /// UGC 大图
  Widget _getUGCCover() {
    return ClipRRect(
      child: Image.network(
        'https://uploadbeta.com/api/pictures/random',
        width: 280,
        height: 300,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    );
  }

  Widget _getUGCDesc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 12.0),
      child: Text(
        '具惠善日本东京街头拍写真-秋日里浓浓文艺氛围氛围-具惠善日本东京街头拍写真-秋日里浓浓文艺氛围氛围',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        /// 文字最大行数
        maxLines: 2,
        /// 文字显示不下时, 结尾显示 ...
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _getUGCUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0, top: 3.0, right: 9.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            child: ClipOval(
              child: Image.network(
                'https://uploadbeta.com/api/pictures/random/?key=%E6%8E%A8%E5%A5%B3%E9%83%8E',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(width: 10.0,),
          Text(
            '野比大雄',
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromARGB(0xFF, 0x96, 0x96, 0x96),
            ),
          ),
          Expanded(child: Container(),),
          Icon(Icons.star_border,),
          Container(width: 5.0,),
          Text(
            '233',
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.5, 0.5), /// 阴影xy轴偏移量
                blurRadius: 3.0, /// 阴影模糊程度
              ),
              BoxShadow(color: Colors.grey[300], offset: Offset(-0.5, -0.5), blurRadius: 3),
              BoxShadow(color: Colors.grey[300], offset: Offset(0.5, -0.5), blurRadius: 3),
              BoxShadow(color: Colors.grey[300], offset: Offset(-0.5, 0.5), blurRadius: 3),
            ],
          ),
          width: 280,
          child: Column(
            children: <Widget>[
              _getUGCCover(),
              _getUGCDesc(),
              _getUGCUserInfo(),
            ],
          ),
        ),
      ],
    );
  }
}
