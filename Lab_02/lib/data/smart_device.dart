import 'package:material_ui/material_ui.dart';

class SmartDevice {
  const SmartDevice({
    required this.name,
    required this.room,
    required this.description,
    required this.icon,
    required this.isOn,
    required this.value,
  });

  final String name;
  final String room;
  final String description;
  final IconData icon;
  final bool isOn;
  final String value;
}
