import 'package:city_card_novoros/domain/role.dart';

String roleDescription({required Role role}) {
  switch (role) {
    case Role.citizen:
      return 'Для постоянных жителей Новороссийска';
    case Role.student:
      return 'Для тех, кто еще студент или ученик';
    case Role.tourist:
      return 'Выбирай, если в городе всего на пару дней и хочешь его узнать получше';
  }
}
