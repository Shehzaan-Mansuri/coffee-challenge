import 'package:coffee_challenge/utils/imports.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.productId,
  });
  final num productId;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late ProductModel product;
  @override
  void initState() {
    product =
        productsData.firstWhere((element) => element.id == widget.productId);
    super.initState();
  }

  List sizes = ['S', 'M', 'L'];
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            splashRadius: 20,
            icon: Icon(
              Icons.arrow_back_ios,
              color: KColors.black_2F2D2C,
            ),
          ),
        ),
        title: Text(
          'Detail',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: KColors.black_2F2D2C,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: SvgPicture.asset('assets/icons/fav.svg'),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: context.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: product.id,
                      child: Container(
                        margin: const EdgeInsets.only(top: 25, bottom: 20),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/products/${product.image}.png',
                            height: context.width * 0.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 71, 51, 31),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'with ${product.addons}',
                              style: TextStyle(
                                color: KColors.grey_9B9B9B,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/star.svg',
                                  height: 16,
                                ),
                                const SizedBox(width: 4),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${product.ratings}",
                                        style: TextStyle(
                                          color: KColors.black_2F2D2C,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' (${product.noOfReviews})',
                                        style: TextStyle(
                                          color: KColors.grey_7F7F7F,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/bean.png',
                              height: 45,
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/milk.png',
                              height: 45,
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: KColors.whiteEAEAEA,
                      height: 30,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: KColors.black_2E2D2C,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ReadMoreText(
                      product.description,
                      trimLines: 3,
                      trimCollapsedText: 'Read More',
                      trimExpandedText: 'Read Less',
                      trimMode: TrimMode.Line,
                      moreStyle: TextStyle(
                        color: KColors.kPrimaryColor,
                        fontSize: 14,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        height: 0.12,
                      ),
                      style: TextStyle(
                          color: KColors.grey_9B9B9B,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Size',
                      style: TextStyle(
                        color: KColors.black_2E2D2C,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 0; i < sizes.length; i++)
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => selectedSize = sizes[i]),
                              child: Container(
                                margin: i == 0
                                    ? const EdgeInsets.only(right: 10)
                                    : i == sizes.length - 1
                                        ? const EdgeInsets.only(left: 10)
                                        : null,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  color: selectedSize == sizes[i]
                                      ? KColors.whiteFFF4EE
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: selectedSize == sizes[i]
                                          ? KColors.kPrimaryColor
                                          : KColors.whiteDEDEDE,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  sizes[i],
                                  style: TextStyle(
                                    color: KColors.black_2F2D2C,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: context.height * .1)
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: context.width,
            height: context.height * .13,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        color: KColors.grey_9B9B9B,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$ ${product.price}',
                      style: TextStyle(
                        color: KColors.kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, orderRoute,
                      arguments: product.id),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width * .15, vertical: 21),
                    decoration: ShapeDecoration(
                      color: KColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
