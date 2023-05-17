class TaskEntity {
  final String title;
  final String detail;
  bool isActive;

  TaskEntity({required this.detail, required this.title, this.isActive = false});
}
