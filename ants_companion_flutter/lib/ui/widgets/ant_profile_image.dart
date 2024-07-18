import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';

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
    final profileImageProvider =
        kIsWeb ? Image.network(src).image : NetworkImageWithRetry(src);

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: profileImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
        ),
      ),
    );
  }
}
