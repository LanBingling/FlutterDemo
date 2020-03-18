import 'package:flutter/material.dart';

class FeedBanner extends StatefulWidget {
  @override
  _FeedBannerState createState() => _FeedBannerState();
}

class _FeedBannerState extends State<FeedBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
