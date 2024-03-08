import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyStateScreen extends StatelessWidget {
  const EmptyStateScreen(
      {super.key, required this.caption, required this.animationUrl});
  final String caption;
  final String animationUrl;

 


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Lottie.asset(animationUrl, height: 40.h),
        Text(caption)
      ],
    ));
  
  }
}
