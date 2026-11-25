import 'package:lab_2_1/app_routes.dart';
import 'package:lab_2_1/widgets/primary_button.dart';
import 'package:material_ui/material_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(
                    Icons.home_rounded,
                    size: 64,
                    color: Color(0xFF167D72),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Ваш дім — під контролем',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Увійдіть, щоб керувати розумними пристроями.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Електронна пошта',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 22),
                  PrimaryButton(
                    label: 'Увійти',
                    onPressed: () => Navigator.pushNamedAndRemoveUntil<void>(
                      context,
                      AppRoutes.dashboard,
                      (_) => false,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.pushNamed<void>(
                      context,
                      AppRoutes.registration,
                    ),
                    child: const Text('Створити акаунт'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
