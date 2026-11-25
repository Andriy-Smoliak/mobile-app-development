import 'package:lab_2_1/data/smart_device.dart';
import 'package:material_ui/material_ui.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({required this.device, required this.onTap, super.key});

  final SmartDevice device;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).colorScheme.primary;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: accent.withValues(alpha: 0.1),
                    foregroundColor: accent,
                    child: Icon(device.icon),
                  ),
                  const Spacer(),
                  Icon(
                    device.isOn ? Icons.circle : Icons.circle_outlined,
                    size: 12,
                    color: device.isOn ? accent : Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(device.name, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(device.room, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 12),
              Text(
                device.value,
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(color: accent, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
