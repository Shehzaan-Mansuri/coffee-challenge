import 'package:coffee_challenge/utils/imports.dart';

class KBottomBar extends StatefulWidget {
  const KBottomBar({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  State<KBottomBar> createState() => _KBottomBarState();
}

class _KBottomBarState extends State<KBottomBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          // here we check if the product is added to cart or not
          boxShadow: [
            BoxShadow(
              color: KColors.black_000000.withOpacity(0.08),
              // blurRadius: 24,
              blurRadius: 24,
              spreadRadius: -7,
              offset: const Offset(0, -20),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kNavigationTab(
              icon: 'home',
              isActive: _currentIndex == 0,
              index: 0,
            ),
            kNavigationTab(
              icon: 'heart',
              isActive: _currentIndex == 1,
              index: 1,
            ),
            kNavigationTab(
              icon: 'bag',
              isActive: _currentIndex == 2,
              index: 2,
            ),
            kNavigationTab(
              icon: 'bell',
              isActive: _currentIndex == 3,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  /// This is the widget for the bottom navigation tab
  Widget kNavigationTab({
    Key? key,
    required String icon,
    required bool isActive,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        widget.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _currentIndex = index;
        setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: index == 0
              ? const BorderRadius.only(
                  topLeft: Radius.circular(24),
                )
              : index == 3
                  ? const BorderRadius.only(
                      topRight: Radius.circular(24),
                    )
                  : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
              colorFilter: isActive
                  ? ColorFilter.mode(
                      KColors.kPrimaryColor,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
            const SizedBox(height: 8),
            Container(
              width: 10,
              height: 5,
              decoration: !isActive
                  ? const BoxDecoration()
                  : ShapeDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(-0.98, -0.17),
                        end: const Alignment(0.98, 0.17),
                        colors: [
                          KColors.kPrimaryColor,
                          KColors.orangeECAA81,
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
