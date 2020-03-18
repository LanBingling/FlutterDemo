
import 'package:flutter/material.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_item_view.dart';

class GmuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed List',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: FeedListPage(),
      /// 去掉右上角的Debug标识
      debugShowCheckedModeBanner: false,
    );
  }
}

class FeedListPage extends StatefulWidget {
  @override
  _FeedListPageState createState() => _FeedListPageState();
}

class _FeedListPageState extends State<FeedListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed List'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black12,
        child: Center(child: UGCItem()),
      ),
    );
  }
}
