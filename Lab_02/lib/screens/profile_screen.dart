import 'package:lab_2_1/app_routes.dart';
import 'package:lab_2_1/widgets/primary_button.dart';
import 'package:material_ui/material_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профіль')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 44,
                  child: Icon(Icons.person_outline, size: 44),
                ),
                const SizedBox(height: 16),
                Text(
                  'Андрій Смоляк',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                const Text('andrii@example.com'),
                const SizedBox(height: 32),
                PrimaryButton(
                  label: 'Вийти',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil<void>(
                    context,
                    AppRoutes.login,
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
