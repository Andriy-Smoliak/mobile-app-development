import 'package:lab_2_1/app_routes.dart';
import 'package:lab_2_1/data/mock_devices.dart';
import 'package:lab_2_1/data/smart_device.dart';
import 'package:lab_2_1/widgets/device_card.dart';
import 'package:material_ui/material_ui.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мій розумний дім'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Профіль',
            onPressed: () =>
                Navigator.pushNamed<void>(context, AppRoutes.profile),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final int columns = constraints.maxWidth >= 900
              ? 3
              : constraints.maxWidth >= 560
              ? 2
              : 1;
          final double width = constraints.maxWidth > 1100
              ? 1100
              : constraints.maxWidth;

          return Center(
            child: SizedBox(
              width: width,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Доброго дня, Андрію!',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    const Text('Усі системи працюють у звичному режимі.'),
                    const SizedBox(height: 22),
                    const _OverviewCard(),
                    const SizedBox(height: 28),
                    Text(
                      'Пристрої',
                      style: Theme.of(context).textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 12),
                    GridView.builder(
                      itemCount: mockDevices.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final SmartDevice device = mockDevices[index];
                        return DeviceCard(
                          device: device,
                          onTap: () => Navigator.pushNamed<void>(
                            context,
                            AppRoutes.deviceDetails,
                            arguments: device,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 28,
          runSpacing: 18,
          children: const <Widget>[
            _OverviewValue(label: 'Пристрої онлайн', value: '4 з 5'),
            _OverviewValue(label: 'Температура', value: '21°'),
            _OverviewValue(label: 'Безпека', value: 'У нормі'),
          ],
        ),
      ),
    );
  }
}

class _OverviewValue extends StatelessWidget {
  const _OverviewValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
