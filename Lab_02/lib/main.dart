import 'package:lab_2_1/app_routes.dart';
import 'package:lab_2_1/theme/app_theme.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Розумний дім — Lab 2.1',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: AppRoutes.login,
      onGenerateRoute: generateAppRoute,
    );
  }
}
