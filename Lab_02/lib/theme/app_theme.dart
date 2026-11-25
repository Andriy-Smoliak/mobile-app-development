import 'package:material_ui/material_ui.dart';

ThemeData buildAppTheme() {
  const Color seed = Color(0xFF167D72);
  final ColorScheme colors = ColorScheme.fromSeed(
    seedColor: seed,
    surface: const Color(0xFFF5F8F7),
  );

  return ThemeData(
    colorScheme: colors,
    scaffoldBackgroundColor: colors.surface,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.surface,
      foregroundColor: const Color(0xFF183331),
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE5ECE9)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFDCE6E2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFDCE6E2)),
      ),
    ),
  );
}
