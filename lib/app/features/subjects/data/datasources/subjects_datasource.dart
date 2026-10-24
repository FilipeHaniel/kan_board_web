import 'package:kan_board_web/app/features/dashboard/data/models/dashboard_subject_model.dart';
import 'package:kan_board_web/app/features/subjects/data/model/subject_model.dart';

abstract interface class SubjectsDatasource {
  Future<List<DashboardSubjectModel>> getSubjects(String goalId);

  Future<SubjectModel> createSubject(SubjectModel subject);
}
