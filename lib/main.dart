import 'package:coffee_challenge/utils/imports.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sora',
        scaffoldBackgroundColor: KColors.kSecondaryColor,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: splashRoute,
    );
  }
}
