import 'package:flutter/widgets.dart';

abstract final class KanBoardDSInsets {
  KanBoardDSInsets._();

  static const EdgeInsets all4 = EdgeInsets.all(4);

  static const EdgeInsets all8 = EdgeInsets.all(8);

  static const EdgeInsets all12 = EdgeInsets.all(12);

  static const EdgeInsets all16 = EdgeInsets.all(16);

  static const EdgeInsets all20 = EdgeInsets.all(20);

  static const EdgeInsets all24 = EdgeInsets.all(24);

  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16);

  static const EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: 24);

  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: 8);

  static const EdgeInsets vertical12 = EdgeInsets.symmetric(vertical: 12);

  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: 16);

  static const EdgeInsets screen = EdgeInsets.all(24);
}
