import 'package:coffee_challenge/utils/imports.dart';

class Utils {
  // show snackbar
  // Snack bar
  static void showMessage(
      {required String message,
      Color color = Colors.red,
      required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
