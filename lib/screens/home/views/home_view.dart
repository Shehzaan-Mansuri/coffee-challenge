import 'package:coffee_challenge/utils/imports.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List tabs = ["All", 'Cappuccino', 'Machiato', 'Latte', 'Americano'];
  int selectedFilterIndex = 0;
  bool isItemAdded = false;
  List<ProductModel> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // Initialize filteredProducts with all products initially
    filteredProducts = productsData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: context.height,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // This is for the header with banner
                buildHeaderWithBanner(context),
                // This is for the filter tabs
                buildFilterTabs(),
                // This is for the product grid
                buildProductGrid(context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Function to return the header with banner
  Widget buildHeaderWithBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [KColors.black_303030, KColors.black_131313],
              ),
            ),
            height: context.height * 0.34,
            width: context.width,
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Column(
                children: [
                  // For the header with name location and profile image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: KColors.whiteB6B6B6,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Bilzen, Tanjungbalai',
                                style: TextStyle(
                                  color: KColors.whiteDDDDDD,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: KColors.whiteDDDDDD,
                              )
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/profile.png',
                        height: 44,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    decoration: ShapeDecoration(
                      color: KColors.black_303030,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, bottom: 12, top: 12),
                          child: SvgPicture.asset('assets/icons/search.svg'),
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: KColors.kPrimaryColor,
                            controller: searchController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (value) {
                              // Filter products based on the search query
                              filteredProducts = productsData
                                  .where((element) => element.title
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: 'Search coffee',
                              hintStyle: TextStyle(
                                color: KColors.white_979797,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        Container(
                          decoration: ShapeDecoration(
                            color: KColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset('assets/icons/setting.svg'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 23, top: 13),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: ShapeDecoration(
                          color: KColors.whiteEC5050,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Promo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Function to return the product grid
  GridView buildProductGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        childAspectRatio: context.width / context.height * 1.15,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: filteredProducts[index].id,
                    child: Container(
                      width: double.infinity,
                      height: context.height * 0.18,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/products/${filteredProducts[index].image}.png"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.16),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        const SizedBox(width: 2),
                        Text(
                          "${filteredProducts[index].ratings}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filteredProducts[index].title,
                      style: TextStyle(
                        color: KColors.black_2F2D2C,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'with ${filteredProducts[index].addons}',
                      style: TextStyle(
                        color: KColors.grey_9B9B9B,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${filteredProducts[index].price}',
                          style: TextStyle(
                            color: KColors.black_2F4B4E,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, detailsRoute,
                                arguments: filteredProducts[index].id);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: ShapeDecoration(
                              color: KColors.kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            .animate(
              delay: Duration(milliseconds: 100 * index),
            )
            .slideY(
              begin: 0.3,
              end: 0,
            )
            .fadeIn(
              begin: 0.3,
              duration: const Duration(milliseconds: 300),
            );
      },
    );
  }

  // Function to return the filter tabs
  SingleChildScrollView buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // reason for this is to add some space before the first tab if added paddding then the scroll will look weird and not so human friendly
          const SizedBox(
            width: 30,
          ),
          ...tabs.map((e) => kFitlerTab(
                title: e,
                isSelected: selectedFilterIndex == tabs.indexOf(e),
                onTap: () {
                  setState(() {
                    selectedFilterIndex = tabs.indexOf(e);
                    filterProducts(tabs
                        .indexOf(e)); // Call the function to filter products
                  });
                },
              ).animate().slideX(
                    begin: 0.3,
                    end: 0,
                    duration: const Duration(milliseconds: 300),
                  )),
        ],
      ),
    );
  }

  // Function to return the filter tab
  Widget kFitlerTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: ShapeDecoration(
          color: isSelected ? KColors.kPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        margin: const EdgeInsets.only(right: 8),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : KColors.black_2F4B4E,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Function to filter products based on the selected index
  void filterProducts(int selectedFilterIndex) {
    if (selectedFilterIndex == 0) {
      // All tab selected, show all products
      filteredProducts = productsData;
      debugPrint(filteredProducts.map((e) => e.title).toString());
    } else {
      // Other tabs selected, show products based on the coffee type
      filteredProducts = productsData
          .where((element) => element.coffeeType == tabs[selectedFilterIndex])
          .toList();
      debugPrint(filteredProducts.map((e) => e.title).toString());
    }
  }
}
