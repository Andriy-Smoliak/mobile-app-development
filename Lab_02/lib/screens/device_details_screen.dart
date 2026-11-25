import 'package:lab_2_1/data/smart_device.dart';
import 'package:material_ui/material_ui.dart';

class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({required this.device, super.key});

  final SmartDevice device;

  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: Text(device.name)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: accent.withValues(alpha: 0.1),
                      foregroundColor: accent,
                      child: Icon(device.icon, size: 32),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      device.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 6),
                    Text(device.room),
                    const SizedBox(height: 18),
                    Text(device.description),
                    const SizedBox(height: 24),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Поточний стан'),
                      trailing: Text(
                        device.value,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Живлення'),
                      trailing: Text(device.isOn ? 'Увімкнено' : 'Вимкнено'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
