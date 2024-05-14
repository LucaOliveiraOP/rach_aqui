import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageOverlayWidget extends StatelessWidget {
  final String backgroundImage;
  final String overlayImage;

  const ImageOverlayWidget(
      {required this.backgroundImage, required this.overlayImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned.fill(
          child: SvgPicture.asset(
            overlayImage,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
