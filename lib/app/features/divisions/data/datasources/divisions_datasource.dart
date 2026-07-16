import 'package:kan_board_web/app/features/divisions/data/models/division_model.dart';

abstract class DivisionsDatasource {
  Future<List<DivisionModel>> getDivisions(String goalId);

  Future<void> createDivision(DivisionModel division);
}
