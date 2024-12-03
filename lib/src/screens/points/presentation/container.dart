import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: 16), // Add some side padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow
              blurRadius: 10, // Blur effect
              offset: const Offset(0, 4), // Position of the shadow
            ),
          ],
        ),
        child: ClipPath(
          clipper: CustomShapeClipper(), // Custom shape for side cutouts
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutoutRadius = size.height * 0.1; // Proportional side cutout

    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(12),
        bottomLeft: const Radius.circular(12),
        bottomRight: const Radius.circular(12),
      ))
      ..addOval(Rect.fromCircle(
        center: Offset(0, size.height / 2),
        radius: cutoutRadius,
      ))
      ..addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2),
        radius: cutoutRadius,
      ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
