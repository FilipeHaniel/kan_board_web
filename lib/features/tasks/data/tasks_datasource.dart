import 'package:dio/dio.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';

class TasksDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
    ),
  );

  Future<List<Task>> getTasks() async {
    final response = await dio.get('/tasks');

    return (response.data as List).map((json) => Task.fromJson(json)).toList();
  }

  Future<void> moveTask(String id, String status) async {
    await dio.patch(
      '/tasks/$id/move',
      data: {'status': status},
    );
  }
}
