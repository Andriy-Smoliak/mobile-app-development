import 'package:lab_2_1/app_routes.dart';
import 'package:lab_2_1/widgets/primary_button.dart';
import 'package:material_ui/material_ui.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Реєстрація')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Створіть обліковий запис',
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Додайте дані, щоб налаштувати свій розумний дім.',
                  ),
                  const SizedBox(height: 18),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Ім’я',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Електронна пошта',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    label: 'Створити обліковий запис',
                    onPressed: () => Navigator.pushNamedAndRemoveUntil<void>(
                      context,
                      AppRoutes.dashboard,
                      (_) => false,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Уже маєте акаунт? Увійти'),
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
