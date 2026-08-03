import 'package:kan_board_web/app/features/subjects/data/model/subject_model.dart';

abstract interface class SubjectsDatasource {
  Future<List<SubjectModel>> getSubjects(String goalId);

  Future<SubjectModel> createSubject(SubjectModel subject);
}
