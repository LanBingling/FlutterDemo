import 'package:flutter/material.dart';

class UGCBanner extends StatefulWidget {
  @override
  _UGCBannerState createState() => _UGCBannerState();
}

class _UGCBannerState extends State<UGCBanner> {
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
