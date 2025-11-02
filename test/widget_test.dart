import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas7/main.dart'; 

void main() {
  testWidgets('Menambah tugas baru di To-Do List', (WidgetTester tester) async {
    // Jalankan aplikasi utama
    await tester.pumpWidget(const ToDoApp());

    // Pastikan TextField ada
    expect(find.byType(TextField), findsOneWidget);

    // Ketik teks baru
    await tester.enterText(find.byType(TextField), 'Belajar');
    await tester.tap(find.text('Tambah'));
    await tester.pump();

    // Verifikasi teks muncul di daftar
    expect(find.text('Belajar'), findsOneWidget);
  });
}
