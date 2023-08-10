// Importe a classe Task

abstract class TasksUseCase {
  //Future<List<Task>> getAllTasks();
  Future<void> addTask(String title, String description);
  Future<void> completeTask(String taskId);
  Future<void> deleteTask(String taskId);
  // Outros casos de uso relacionados a tarefas
}
