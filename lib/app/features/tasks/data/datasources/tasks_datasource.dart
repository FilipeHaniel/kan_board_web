import 'package:dio/dio.dart';
import 'package:kan_board_web/app/features/tasks/data/models/task_model.dart';

class TasksDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
    ),
  );

  Future<List<TaskModel>> getTasks() async {
    print('GET /tasks');
    final response = await dio.get('/tasks');
    print(response.data);

    return (response.data as List)
        .map((json) => TaskModel.fromJson(json))
        .toList();
  }

  Future<void> moveTask(String id, String status) async {
    await dio.patch(
      '/tasks/$id/move',
      data: {'status': status},
    );
  }
}
