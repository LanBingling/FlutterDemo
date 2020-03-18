import 'package:flutter/material.dart';
import 'package:flutter_from_0to1_demo/feed_list/feed_banner.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_item_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UGCStaggeredView extends StatefulWidget {
  @override
  _UGCStaggeredViewState createState() => _UGCStaggeredViewState();
}

class _UGCStaggeredViewState extends State<UGCStaggeredView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return FeedBanner();
            } else {
              return UGCItem();
            }
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(index == 0 ? 2 : 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
