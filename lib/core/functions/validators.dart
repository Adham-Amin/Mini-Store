abstract class Validators {
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "ادخل الاسم";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "ادخل البريد الالكتروني";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return "ادخل بريد صحيح";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "ادخل كلمة المرور";
    }

    final errors = <String>[];

    if (value.length < 8) {
      errors.add("• يجب أن يكون على الأقل 8 حروف");
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errors.add("• يجب أن يحتوي على حرف كبير");
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      errors.add("• يجب أن يحتوي على حرف صغير");
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      errors.add("• يجب أن يحتوي على رقم");
    }
    if (!RegExp(r'[!@#\$&*~%^()\-_+=<>?/.,]').hasMatch(value)) {
      errors.add("• يجب أن يحتوي على رمز");
    }

    if (errors.isEmpty) return null;
    return errors.join('\n');
  }
}
