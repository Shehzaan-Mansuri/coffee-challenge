import 'package:coffee_challenge/utils/imports.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.id});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
  final int id;
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;
  late ProductModel product;
  int quantity = 1;

  @override
  void initState() {
    product = productsData.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: context.height,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDeliveryTabs(),
                        buildAddressInfo(),
                      ],
                    ),
                  ),
                  Divider(color: KColors.whiteF4F4F4, height: 40, thickness: 4),
                  buildPaymentSummary()
                ],
              ),
            ),
          ),
          buildBottomContainer()
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: KColors.black_2F2D2C,
          ),
        ),
      ),
      title: Text(
        'Order',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: KColors.black_2F2D2C,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Container buildDeliveryTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: KColors.whiteF2F2F2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: TabBar(
          onTap: (index) => setState(() => selectedIndex = index),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          indicatorPadding: const EdgeInsets.symmetric(vertical: 2),
          unselectedLabelStyle: TextStyle(
            color: KColors.black_2E2D2C,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: ShapeDecoration(
            color: KColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(
              child: Text(
                'Deliver',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Pick Up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
    );
  }

  Column buildAddressInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          '${selectedIndex == 0 ? "Delivery" : "Pick Up"} Address',
          style: TextStyle(
            color: KColors.black_2F2D2C,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          selectedIndex == 0 ? 'Jl. Kpg Sutoyo' : 'Coffee Shop',
          style: TextStyle(
            color: KColors.grey_303336,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          selectedIndex == 0
              ? 'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.'
              : 'Jl. Kpg Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: TextStyle(
            color: KColors.grey_7F7F7F,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 15),
        if (selectedIndex == 0)
          Row(
            children: [
              buildChipButton(
                icon: 'edit',
                text: 'Edit Address',
                onTap: () {},
              ),
              const SizedBox(width: 8),
              buildChipButton(
                icon: 'notes',
                text: 'Add Notes',
                onTap: () {},
              ),
            ],
          ),
        Divider(color: KColors.whiteEAEAEA, height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: product.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/products/${product.image}.png',
                      height: context.width * 0.14,
                      width: context.width * 0.14,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width * 0.35,
                      child: Text(
                        product.title,
                        style: TextStyle(
                          color: KColors.black_2F2D2C,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'with ${product.addons}',
                      style: TextStyle(
                        color: KColors.grey_9B9B9B,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: context.width * 0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: KColors.greyDEDEDE, width: 1),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      } else {
                        Utils.showMessage(
                            message: 'Quantity cannot be less than 1',
                            context: context,
                            color: Colors.red.shade800);
                      }
                    },
                    icon: const Icon(Icons.remove),
                    iconSize: 18,
                    color: quantity == 1
                        ? KColors.greyDEDEDE
                        : KColors.black_2F2D2C,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  quantity.toString(),
                  style: TextStyle(
                    color: KColors.black_2F2D2C,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  height: context.width * 0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: KColors.greyDEDEDE,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 18,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Padding buildPaymentSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: KColors.whiteEAEAEA,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/discount.svg', height: 25),
                    const SizedBox(width: 12),
                    Text(
                      '1 Discount is applied',
                      style: TextStyle(
                        color: KColors.black_2E2D2C,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Payment Summary',
            style: TextStyle(
              color: KColors.black_2E2D2C,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\$ ${product.price}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                '\$ 3.0',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                  height: 0,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '\$ 1.12',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Divider(color: KColors.whiteEAEAEA, height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Payment',
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\$ ${product.price + 1.12}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: KColors.black_2E2D2C,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBottomContainer() {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 30,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
          BoxShadow(
            color: KColors.grey_4E4E4,
            blurRadius: 24,
            offset: const Offset(0, -10),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/cash.svg', height: 25),
              const SizedBox(width: 10),
              Container(
                decoration: ShapeDecoration(
                  color: KColors.whiteF6F6F6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(right: 14),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: ShapeDecoration(
                        color: KColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Cash',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$ 5.53',
                      style: TextStyle(
                        color: KColors.black_2F2D2C,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/other.svg', height: 25),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => Navigator.pushNamed(context, trackingRoute),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 21),
              width: context.width,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: KColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * 0.02),
        ],
      ),
    );
  }

  Widget buildChipButton({
    required VoidCallback onTap,
    required String text,
    required String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: KColors.greyDEDEDE),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/$icon.svg", height: 15),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: KColors.grey_303336,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
