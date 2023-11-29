import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: Colors.red,
        rightDotColor: Colors.black,
        size: 50,
      ),
    );
  }
}
