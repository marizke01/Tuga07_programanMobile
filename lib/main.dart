import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/todo_controller.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'List Tugas',
      debugShowCheckedModeBanner: false,
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController textController = TextEditingController();

  ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Tugas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input teks
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Ketik tugas baru...",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                todoController.addTodo(value);
                textController.clear();
              },
            ),
            const SizedBox(height: 10),
            // Tombol tambah
            ElevatedButton(
              onPressed: () {
                todoController.addTodo(textController.text);
                textController.clear();
              },
              child: const Text("Tambah"),
            ),
            const SizedBox(height: 20),

            // Daftar tugas dinamis
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (context, index) {
                      final item = todoController.todos[index];
                      return Card(
                        child: ListTile(
                          title: Text(item),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
