class Validators {
  static String? validateName(String? value) {
    final String name = value?.trim() ?? '';
    if (name.isEmpty) {
      return 'Введіть ім’я';
    }
    if (name.length < 2) {
      return 'Ім’я має містити щонайменше 2 символи';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final String email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Введіть електронну пошту';
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      return 'Введіть коректну електронну пошту';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введіть пароль';
    }
    if (value.length < 6) {
      return 'Пароль має містити щонайменше 6 символів';
    }
    return null;
  }
}
