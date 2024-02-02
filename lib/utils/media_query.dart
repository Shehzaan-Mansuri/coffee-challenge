import 'imports.dart';

/// This extension is used to get the height and width of the screen size
/// Example:
/// ```dart
/// Container(
///  height: context.height * 0.5,
/// width: context.width,
/// )
/// ```
extension MediaQuerry on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
