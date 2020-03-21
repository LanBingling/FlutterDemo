import 'dart:async';

import 'package:flutter/material.dart';

class UGCBanner extends StatefulWidget {

  UGCBanner({
    Key key,
    this.height = 0,
    this.width = 0,
    this.initialPage = 0,
    this.scrollDirection = Axis.horizontal,
    this.autoDisplayInterval = 5,
    this.onPageSelected,
    this.onPageClicked
  }) :super(key: key);

  final double width;
  final double height;

  final int initialPage;
  final Axis scrollDirection;
  final int autoDisplayInterval;

  final ValueChanged<int> onPageSelected;
  final ValueChanged<int> onPageClicked;

  @override
  _UGCBannerState createState() => _UGCBannerState();
}

class _UGCBannerState extends State<UGCBanner> {

  int _selectedPage = 0;
  PageController _controller;
  Timer _timer;
  var _images = {
    "http://ww1.sinaimg.cn/large/610dc034ly1ffmwnrkv1hj20ku0q1wfu.jpg",
    "http://avatar.cdn.gmugmu.com/12573300_913483",
    "http://avatar.cdn.gmugmu.com/6531288_561506",
    "http://avatar.cdn.gmugmu.com/6962257_408YNn"};

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: widget.initialPage,
      keepPage: true,
    );
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    _releaseTimer();
  }

  void _onHorizontalDragDown(DragDownDetails details) {
    if (_timer == null) {
      return;
    }
    _releaseTimer();
    Future.delayed(Duration(seconds: 5)).then((onValue) {
      _startTimer();
    });
  }

  void _onPageClick() {
    widget?.onPageClicked(_selectedPage);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
    widget?.onPageSelected(index);
  }

  void _startTimer() {
    if (widget.autoDisplayInterval <= 0) {
      return;
    }
    _timer =
        Timer.periodic(Duration(seconds: widget.autoDisplayInterval), (timer) {
          _selectedPage++;
          _selectedPage = _selectedPage % _images.length;
          _controller?.animateToPage(
            _selectedPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
          );
          _onPageChanged(_selectedPage);
        });
  }

  void _releaseTimer() {
    if (_timer != null && !_timer.isActive) {
      return;
    }
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 120.0,
        child: GestureDetector(
          onHorizontalDragDown: _onHorizontalDragDown,
          onTap: _onPageClick,
          child: PageView(
            controller: _controller,
            children: _images.map((img) {
              return Image.network(img,fit: BoxFit.cover,);
            }).toList(),
            scrollDirection: widget.scrollDirection,
            onPageChanged: _onPageChanged,
          ),
        ),
      ),
    );
  }
}
