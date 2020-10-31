class Task {
  String data;
  bool isDone;

  Task({this.data, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}