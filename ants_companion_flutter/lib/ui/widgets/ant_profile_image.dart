import 'package:flutter/material.dart';

class AntProfileImage extends StatelessWidget {
  const AntProfileImage({
    super.key,
    required this.src,
    this.radius = 65.0,
    this.onTap,
  });

  final String src;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 180, maxHeight: 180),
      child: Image.network(
        src,
        fit: BoxFit.cover,
      ),
    );
    //   return Container(
    //     width: radius * 2,
    //     height: radius * 2,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       image: DecorationImage(
    //         image: Image.network(imagePath),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     child: Material(
    //       color: Colors.transparent,
    //       shape: CircleBorder(),
    //       child: InkWell(
    //         borderRadius: BorderRadius.circular(radius),
    //         onTap: onTap,
    //       ),
    //     ),
    //   );
  }
}
