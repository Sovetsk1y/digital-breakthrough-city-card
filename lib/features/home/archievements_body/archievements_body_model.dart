import 'package:city_card_novoros/domain/archievements/archievement.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';

final List<Archievement> archievements = [
  Archievement(
    name: 'Водитель',
    svgName: parkingSvgPath,
    description: 'Заплатите за парковку 5 раз',
    isArchieved: false,
  ),
  Archievement(
    name: 'Спортсмен',
    svgName: sportSvgPath,
    description: 'Купите 3 абонемента в спортиные залы',
    isArchieved: false,
  ),
  Archievement(
    name: 'Эстет',
    svgName: cultureSvgPath,
    description: 'Посетите 2 культурных мероприятия',
    isArchieved: false,
  ),
  Archievement(
    name: 'Гурман',
    svgName: cafeSvgPath,
    description: 'Пообедай в 5 кафе в этом месяце',
    isArchieved: true,
  ),
];
