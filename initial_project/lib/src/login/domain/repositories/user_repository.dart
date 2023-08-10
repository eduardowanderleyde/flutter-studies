// user_repository.dart
abstract class UserRepository {
  //Future<User?> getUserByUsername(String username);
}

// task_repository.dart
abstract class TaskRepository {
  //Future<List<Task>> getAllTasks();
  //Future<void> addTask(Task task);
  //Future<void> updateTask(Task task);
  Future<void> deleteTask(String taskId);
}
