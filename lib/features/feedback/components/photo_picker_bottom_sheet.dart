import 'dart:io';

import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerBottomSheet extends StatelessWidget {
  final void Function(File)? onImagePicked;

  const PhotoPickerBottomSheet({
    Key? key,
    this.onImagePicked,
  }) : super(key: key);

  Future<void> _pickCamera(BuildContext context) async {
    final photo =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (photo == null) return;
    onImagePicked?.call(File(photo.path));
    Navigator.of(context).pop();
  }

  Future<void> _pickGallery(BuildContext context) async {
    final photo =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (photo == null) return;
    onImagePicked?.call(File(photo.path));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
              onTap: () => _pickCamera(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.photo_camera_solid,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Сделать снимок',
                    style:
                        secondaryTextSemiBold17.copyWith(color: Colors.white),
                  ),
                ],
              )),
          const SizedBox(height: 9),
          AppButton(
              onTap: () => _pickGallery(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.photo,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Выбрать из галереи',
                    style:
                        secondaryTextSemiBold17.copyWith(color: Colors.white),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
