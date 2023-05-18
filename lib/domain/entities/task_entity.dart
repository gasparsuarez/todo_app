class TaskEntity {
  final String title;
  final String detail;
  bool isActive;
  bool isFavorite;

  TaskEntity(
      {required this.detail, required this.title, this.isActive = false, this.isFavorite = false});
}
