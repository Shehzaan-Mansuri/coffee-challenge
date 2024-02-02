import 'package:coffee_challenge/utils/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.whiteF9F9F9,
      bottomNavigationBar: KBottomBar(
        pageController: _pageController,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          HomePageView(),
          FavoritePageView(),
          CartPageView(),
          NotificationPageView(),
        ],
      ),
    );
  }
}
