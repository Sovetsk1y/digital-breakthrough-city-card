import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final List<TopicData> topics = [
  TopicData(title: 'Дороги', isSelected: false),
  TopicData(title: 'Транспорт', isSelected: false),
  TopicData(title: 'Благоустройство', isSelected: true),
  TopicData(title: 'Другое', isSelected: false),
];

void selectTopic(TopicData selectedTopic) {
  for (final topic in topics) {
    if (selectedTopic.title == topic.title) {
      topic.isSelected = true;
    } else {
      topic.isSelected = false;
    }
  }
}

Future<File?> pickGallery(BuildContext context) async {
  final photo =
      await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  if (photo == null) return null;
  return File(photo.path);
}

class TopicData {
  final String title;
  bool isSelected;

  TopicData({
    required this.title,
    required this.isSelected,
  });
}
