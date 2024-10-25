import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:uts_mobile_dev_2024/main.dart'; // Sesuaikan dengan path file aplikasi utama Anda.

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        VoidKomputerApp()); // Ubah ke root widget aplikasi utama Anda

    // Verify that our counter starts at 0.
    expect(find.text('0'),
        findsOneWidget); // Mencari teks "0" yang seharusnya muncul
    expect(find.text('1'), findsNothing); // Memastikan teks "1" belum ada

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add)); // Simulasi tap pada icon "+"
    await tester.pump(); // Trigger frame baru setelah event

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); // Pastikan "0" sudah tidak ada
    expect(find.text('1'), findsOneWidget); // Pastikan "1" sekarang muncul
  });
}
