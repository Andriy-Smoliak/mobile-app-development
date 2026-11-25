import 'package:lab_2_1/data/smart_device.dart';
import 'package:material_ui/material_ui.dart';

const List<SmartDevice> mockDevices = <SmartDevice>[
  SmartDevice(
    name: 'Термостат',
    room: 'Вітальня',
    description: 'Підтримує комфортну температуру в оселі.',
    icon: Icons.thermostat,
    isOn: true,
    value: '21°',
  ),
  SmartDevice(
    name: 'Освітлення',
    room: 'Кухня',
    description: 'Розумна лампа з регулюванням яскравості.',
    icon: Icons.lightbulb_outline,
    isOn: true,
    value: '80%',
  ),
  SmartDevice(
    name: 'Очищувач повітря',
    room: 'Спальня',
    description: 'Фільтрує повітря та показує його якість.',
    icon: Icons.air,
    isOn: false,
    value: 'Авто',
  ),
  SmartDevice(
    name: 'Замок',
    room: 'Передпокій',
    description: 'Електронний замок вхідних дверей.',
    icon: Icons.lock_outline,
    isOn: true,
    value: 'Замкнено',
  ),
  SmartDevice(
    name: 'Камера',
    room: 'Подвір’я',
    description: 'Камера безпеки з нічним режимом.',
    icon: Icons.videocam_outlined,
    isOn: true,
    value: 'Онлайн',
  ),
];
