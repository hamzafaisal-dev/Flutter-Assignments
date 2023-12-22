import 'package:final_exam/screens/login_screen.dart';
import 'package:final_exam/screens/profile_screen.dart';
import 'package:final_exam/screens/ui_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

// test 1
  testGoldens('UI Test for UI Screen', (tester) async {
    const widget = MaterialApp(
      home: UIScreen(),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'ui_sc');
  });
}
