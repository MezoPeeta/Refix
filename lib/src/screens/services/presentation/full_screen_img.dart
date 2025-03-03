import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 4.0,
            child: imageUrl.contains("http")
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  )
                : Image.file(File(imageUrl)),
          ),
        ),
      ),
    );
  }
}
