import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/Contents/domain/usecases/get_contents_usecase.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/get_divisions_usecase.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/get_subjects_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/get_tasks_usecase.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetSubjectsUsecase _getSubjects;
  final GetDivisionsUsecase _getDivisions;
  final GetContentsUsecase _getContents;
  final GetTasksUsecase _getTasks;

  DashboardCubit({
    required GetSubjectsUsecase getSubjects,
    required GetDivisionsUsecase getDivisions,
    required GetContentsUsecase getContents,
    required GetTasksUsecase getTasks,
  }) : _getSubjects = getSubjects,
       _getDivisions = getDivisions,
       _getContents = getContents,
       _getTasks = getTasks,
       super(DashboardInitial());

  Future<void> loadDashboard(GoalEntity goal) async {
    emit(DashboardLoading());

    final results = await Future.wait([
      _getSubjects(goal.id),
      _getDivisions(goal.id),
      _getContents(goal.id),
      _getTasks(goal.id),
    ]);

    emit(
      DashboardSuccess(
        goal: goal,
        subjects: results[0] as List<SubjectEntity>,
        divisions: results[1] as List<DivisionEntity>,
        contents: results[2] as List<ContentEntity>,
        tasks: results[3] as List<TaskEntity>,
      ),
    );
  }
}
