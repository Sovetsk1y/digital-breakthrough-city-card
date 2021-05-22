import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/feedback/feedback_page_model.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';

class FeedbackTopicContainer extends StatelessWidget {
  final TopicData topic;
  final VoidCallback? onTap;

  const FeedbackTopicContainer({
    Key? key,
    required this.topic,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: topic.isSelected ? Colors.black : AppColors.labelQuan,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          topic.title,
          style: secondaryTextRegular17.copyWith(
            color: topic.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
