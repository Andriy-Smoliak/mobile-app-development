import 'package:lab_2_1/data/smart_device.dart';
import 'package:lab_2_1/screens/dashboard_screen.dart';
import 'package:lab_2_1/screens/device_details_screen.dart';
import 'package:lab_2_1/screens/login_screen.dart';
import 'package:lab_2_1/screens/profile_screen.dart';
import 'package:lab_2_1/screens/registration_screen.dart';
import 'package:material_ui/material_ui.dart';

abstract final class AppRoutes {
  static const String login = '/';
  static const String registration = '/registration';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String deviceDetails = '/device';
}

Route<void> generateAppRoute(RouteSettings settings) {
  final Widget page = switch (settings.name) {
    AppRoutes.registration => const RegistrationScreen(),
    AppRoutes.dashboard => const DashboardScreen(),
    AppRoutes.profile => const ProfileScreen(),
    AppRoutes.deviceDetails when settings.arguments is SmartDevice =>
      DeviceDetailsScreen(device: settings.arguments! as SmartDevice),
    AppRoutes.deviceDetails => const _UnknownRouteScreen(),
    AppRoutes.login => const LoginScreen(),
    _ => const _UnknownRouteScreen(),
  };

  return MaterialPageRoute<void>(settings: settings, builder: (_) => page);
}

class _UnknownRouteScreen extends StatelessWidget {
  const _UnknownRouteScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сторінку не знайдено')),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil<void>(
            context,
            AppRoutes.login,
            (_) => false,
          ),
          child: const Text('На екран входу'),
        ),
      ),
    );
  }
}
