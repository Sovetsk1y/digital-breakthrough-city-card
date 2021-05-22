import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class FeedbackPhotoContainer extends StatelessWidget {
  final File imageFile;
  final VoidCallback? onDeleteTap;
  const FeedbackPhotoContainer({
    Key? key,
    required this.imageFile,
    this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: kIsWeb
              ? Image.network(
                  imageFile.path,
                  fit: BoxFit.cover,
                  height: 98,
                  width: 101,
                )
              : Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                  height: 98,
                  width: 101,
                ),
        ),
        Positioned(
          top: -24,
          right: -24,
          child: GestureDetector(
            onTap: onDeleteTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.64),
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
