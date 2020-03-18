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
        'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
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
                'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
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
