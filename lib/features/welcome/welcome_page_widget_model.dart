import 'package:city_card_novoros/domain/role.dart';

String roleDescription({required Role role}) {
  switch (role) {
    case Role.citizen:
      return 'Короткое описание карты. Зачаем и кому она нужна.';
    case Role.student:
      return 'Короткое описание карты. Зачаем и кому она нужна.';
    case Role.tourist:
      return 'Короткое описание карты. Зачаем и кому она нужна.';
  }
}
