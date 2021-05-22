import 'package:city_card_novoros/utils/svg_paths.dart';

final categories = [
  CategoryData(
    title: 'Культура',
    svgName: cultureSvgPath,
    cashback: 0,
  ),
  CategoryData(
    title: 'Рестораны/Кафе',
    svgName: cafeSvgPath,
    cashback: 5,
  ),
  CategoryData(
    title: 'Парковка',
    svgName: parkingSvgPath,
    cashback: 0,
  ),
  CategoryData(
    title: 'Спорт',
    svgName: sportSvgPath,
    cashback: 5,
  ),
];

class CategoryData {
  final String title;
  final String svgName;
  final int cashback;

  CategoryData({
    required this.title,
    required this.svgName,
    required this.cashback,
  });
}
