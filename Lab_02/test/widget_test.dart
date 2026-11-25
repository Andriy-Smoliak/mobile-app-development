import 'package:flutter_test/flutter_test.dart';
import 'package:lab_2_1/main.dart';
import 'package:material_ui/material_ui.dart';

const Map<String, Size> _viewports = <String, Size>{
  'small phone': Size(320, 568),
  'phone': Size(375, 812),
  'tablet': Size(768, 1024),
  'wide tablet': Size(1024, 768),
};

Future<void> _tapText(WidgetTester tester, String label) async {
  final Finder target = find.text(label);
  await tester.ensureVisible(target);
  await tester.tap(target);
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull);
}

void main() {
  for (final MapEntry<String, Size> viewport in _viewports.entries) {
    testWidgets('navigation fits ${viewport.key}', (WidgetTester tester) async {
      tester.view.physicalSize = viewport.value;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(const SmartHomeApp());
      expect(find.text('Ваш дім — під контролем'), findsOneWidget);

      await _tapText(tester, 'Створити акаунт');
      expect(find.text('Реєстрація'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).at(0), 'Андрій');
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'andrii@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(2), 'secret123');
      await _tapText(tester, 'Створити обліковий запис');

      expect(find.text('Мій розумний дім'), findsOneWidget);
      await _tapText(tester, 'Термостат');
      expect(find.text('Поточний стан'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Профіль'));
      await tester.pumpAndSettle();
      await _tapText(tester, 'Вийти');
      expect(find.text('Увійти'), findsOneWidget);
    });
  }

  testWidgets('login validates email and password', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SmartHomeApp());

    await tester.enterText(find.byType(TextFormField).at(0), 'invalid-email');
    await tester.enterText(find.byType(TextFormField).at(1), '123');
    await _tapText(tester, 'Увійти');

    expect(find.text('Введіть коректну електронну пошту'), findsOneWidget);
    expect(
      find.text('Пароль має містити щонайменше 6 символів'),
      findsOneWidget,
    );
    expect(find.text('Ваш дім — під контролем'), findsOneWidget);
  });

  testWidgets('registration validates required fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SmartHomeApp());
    await _tapText(tester, 'Створити акаунт');
    await _tapText(tester, 'Створити обліковий запис');

    expect(find.text('Введіть ім’я'), findsOneWidget);
    expect(find.text('Введіть електронну пошту'), findsOneWidget);
    expect(find.text('Введіть пароль'), findsOneWidget);
    expect(find.text('Реєстрація'), findsOneWidget);
  });
}
