import 'package:flutter/material.dart';
import 'package:flutter_from_0to1_demo/feed_list/feed_banner.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_item_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UGCStaggeredView extends StatefulWidget {
  @override
  _UGCStaggeredViewState createState() => _UGCStaggeredViewState();
}

class _UGCStaggeredViewState extends State<UGCStaggeredView> {

  _getSpan(int index) {
    if (index == 0) {
      return 4;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 21,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0
                || index == 6 || index == 7
                || index == 14 || index == 15) {
              return FeedBanner();
            } else {
              return UGCItem();
            }
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(_getSpan(index)),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
