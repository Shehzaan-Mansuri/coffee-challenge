import 'package:coffee_challenge/screens/details/details_screen.dart';
import 'package:coffee_challenge/screens/lost/lost_screen.dart';
import 'package:coffee_challenge/screens/order/order_screen.dart';
import 'package:coffee_challenge/screens/splash/splash_screen.dart';
import 'package:coffee_challenge/screens/tracking/tracking_screen.dart';
import 'package:coffee_challenge/utils/imports.dart';
import 'package:page_transition/page_transition.dart';

// This is a file for storing all the routes in the app.
/* 
!! IMPORTANT !!
*Rules for naming routes: *
1. Use the route name as the key.
2. Use switch case for routing.
3. Use global imports for getting the page & the key.
*/

import 'route_keys.dart';

class Routes {
  /// Generates a route based on the provided [RouteSettings].
  ///
  /// This method is responsible for mapping route names to their respective
  /// screens or pages. It should be used in the MaterialApp's `onGenerateRoute`
  /// property to handle navigation throughout the app.
  ///
  /// [settings] The settings for the route being generated
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Example:
      // For simple routing:
      // case splashRoute:
      //   return MaterialPageRoute(builder: (_) =>  SplashScreen());
      //
      // For routing with arguments:
      // case signUpRoute:
      // Handle the arguments
      //   final String? email = settings.arguments as String?;
      //   return MaterialPageRoute(
      //     builder: (_) => SignUpPage(emailId: email),
      //   );

      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeRoute:
        return PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 700));

      case detailsRoute:
        final num productId = settings.arguments as num;
        return PageTransition(
            child: DetailsScreen(productId: productId),
            type: PageTransitionType.fade);

      case orderRoute:
        final int id = settings.arguments as int;
        return PageTransition(
            child: OrderScreen(id: id), type: PageTransitionType.bottomToTop);
      case trackingRoute:
        return PageTransition(
            child: const TrackingScreen(),
            type: PageTransitionType.bottomToTop);

      default:
        return MaterialPageRoute(builder: (_) => const LostScreen());
    }
  }
}
