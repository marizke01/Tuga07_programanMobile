import 'package:get/get.dart';

class TodoController extends GetxController {
  // List tugas observable (otomatis update UI)
  var todos = <String>[].obs;

  // Tambahkan item baru
  void addTodo(String text) {
    if (text.isNotEmpty) {
      todos.add(text);
    }
  }
}
