import 'dart:io';
import 'dart:ui';

import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/features/feedback/components/feedback_photo_container.dart';
import 'package:city_card_novoros/features/feedback/components/feedback_topic_container.dart';
import 'package:city_card_novoros/features/feedback/components/photo_picker_bottom_sheet.dart';
import 'package:city_card_novoros/features/feedback/feedback_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:city_card_novoros/features/components/back_button.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'components/feedback_success_dialog.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  static const _appBarTitleText = 'Обратная связь';

  bool _pickingPhoto = false;

  List<File> _pickedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: AppBackButton(
                      backgroundColor: AppColors.grey2,
                    ),
                  ),
                ],
              ),
              title: Text(
                _appBarTitleText,
                style: primaryTextSemiBold22,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text('Выбери с чем связан вопрос',
                            style: secondaryTextSemiBold17),
                        const SizedBox(height: 19),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 16,
                          runSpacing: 16,
                          children: topics
                              .map((topic) => FeedbackTopicContainer(
                                    onTap: () =>
                                        setState(() => selectTopic(topic)),
                                    topic: topic,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 23),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            color: AppColors.tabBarGrey,
                            padding: const EdgeInsets.all(16),
                            child: TextField(
                              cursorColor: Colors.black,
                              maxLines: 5,
                              decoration: InputDecoration.collapsed(
                                hintText:
                                    'Опишите вашу проблему или предложение',
                                hintStyle: secondaryTextSemiBold15.copyWith(
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: _pickedPhotos.isEmpty,
                      child: const SizedBox(height: 16),
                    ),
                    Visibility(
                        visible: _pickedPhotos.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            runSpacing: 16,
                            spacing: 16,
                            children: _pickedPhotos
                                .map((photo) => FeedbackPhotoContainer(
                                      onDeleteTap: () {
                                        setState(() {
                                          _pickedPhotos.remove(photo);
                                        });
                                      },
                                      imageFile: photo,
                                    ))
                                .toList(),
                          ),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildAddPhoto(),
                        const SizedBox(height: 18),
                        AppGradientButton(
                            onTap: () {
                              setState(() {
                                _pickingPhoto = true;
                              });
                              showDialog(
                                  context: context,
                                  useRootNavigator: false,
                                  barrierColor: Colors.black26,
                                  builder: (context) =>
                                      FeedbackSuccessDialog()).then((_) {
                                setState(() {
                                  _pickingPhoto = false;
                                });
                              });
                            },
                            text: 'Отправить'),
                        const SizedBox(height: 86),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _pickingPhoto,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile _buildAddPhoto() {
    return ListTile(
      onTap: () {
        setState(() {
          _pickingPhoto = true;
        });
        if (!kIsWeb) {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => PhotoPickerBottomSheet(
                    onImagePicked: (file) {
                      setState(() {
                        _pickedPhotos.add(file);
                      });
                    },
                  )).then((value) {
            setState(() {
              _pickingPhoto = false;
            });
          });
        } else {
          pickGallery(context).then((image) {
            setState(() {
              if (image != null) {
                _pickedPhotos.add(image);
              }
            });
          });
          setState(() {
            _pickingPhoto = false;
          });
        }
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.tabBarGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.add_circled_solid,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(
        'Добавить фото',
        style: primaryTextMedium16,
      ),
    );
  }
}
