import 'package:coffee_challenge/data/models/product_model.dart';

List<ProductModel> productsData = [
  // Cappuccino
  ProductModel(
    id: 1,
    ratings: 4.8,
    noOfReviews: 203,
    price: 4.53,
    title: 'Classic Cappuccino',
    description:
        "A classic cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk. The perfectly balanced combination of bold espresso and smooth, frothy milk creates a delightful coffee experience.",
    addons: 'Chocolate',
    image: 'cappuccino',
    coffeeType: "Cappuccino",
  ),
  ProductModel(
    id: 2,
    ratings: 4.5,
    noOfReviews: 150,
    price: 5.99,
    title: 'Caramel Cappuccino',
    description:
        "Enjoy the rich flavor of caramel in our cappuccino, a perfect blend of espresso and steamed milk topped with a caramel drizzle. Indulge in the sweetness of caramel combined with the boldness of espresso for a luxurious coffee treat.",
    addons: 'Caramel',
    image: 'caramel_cappuccino',
    coffeeType: "Cappuccino",
  ),
  ProductModel(
    id: 3,
    ratings: 4.2,
    noOfReviews: 120,
    price: 6.49,
    title: 'Hazelnut Cappuccino',
    description:
        "Indulge in the nutty goodness of hazelnut with our cappuccino, crafted with care using premium espresso and velvety steamed milk. The distinct flavor of hazelnut adds a delightful twist to the classic cappuccino experience.",
    addons: 'Hazelnut',
    image: 'hazelnut_cappuccino',
    coffeeType: "Cappuccino",
  ),

  // Macchiato
  ProductModel(
    id: 4,
    ratings: 4.5,
    noOfReviews: 180,
    price: 3.99,
    title: 'Caramel Macchiato',
    description:
        "Caramel Macchiato is a delightful combination of espresso, steamed milk, and vanilla syrup, topped with caramel drizzle. Experience the harmony of flavors with each sip, from the richness of caramel to the smoothness of steamed milk.",
    addons: 'Vanilla',
    image: 'caramel_macchiato',
    coffeeType: "Machiato",
  ),
  ProductModel(
    id: 5,
    ratings: 4.3,
    noOfReviews: 140,
    price: 4.29,
    title: 'Chocolate Macchiato',
    description:
        "Satisfy your chocolate cravings with our Chocolate Macchiato, a harmonious blend of espresso, steamed milk, and rich chocolate flavor. Indulge in the perfect balance of coffee and chocolate for a decadent and delightful experience.",
    addons: 'Chocolate',
    image: 'chocolate_macchiato',
    coffeeType: "Machiato",
  ),
  ProductModel(
    id: 6,
    ratings: 4.6,
    noOfReviews: 160,
    price: 4.99,
    title: 'Toffee Nut Macchiato',
    description:
        "Experience the warmth of toffee nut in every sip with our Toffee Nut Macchiato, a perfect balance of espresso and creamy steamed milk. The sweet and nutty notes of toffee create a comforting and indulgent coffee treat.",
    addons: 'Toffee Nut',
    image: 'toffee_nut_macchiato',
    coffeeType: "Machiato",
  ),

  // Latte
  ProductModel(
    id: 7,
    ratings: 4.7,
    noOfReviews: 220,
    price: 5.49,
    title: 'Vanilla Latte Coffee',
    description:
        "Indulge in the smooth and creamy Vanilla Latte, crafted with expertly pulled espresso shots, steamed milk, and a hint of vanilla sweetness. The velvety texture and rich vanilla flavor make it a delightful coffee choice.",
    addons: 'Vanilla',
    image: 'vanilla_latte',
    coffeeType: "Latte",
  ),
  ProductModel(
    id: 8,
    ratings: 4.4,
    noOfReviews: 180,
    price: 5.99,
    title: 'Cinnamon Dolce',
    description:
        "Experience the cozy flavor of cinnamon in our Cinnamon Dolce Latte, a delightful blend of espresso, steamed milk, and cinnamon dolce syrup. The warm and comforting notes of cinnamon add a unique twist to this classic latte.",
    addons: 'Cinnamon',
    image: 'cinnamon_dolce_latte',
    coffeeType: "Latte",
  ),
  ProductModel(
    id: 9,
    ratings: 4.8,
    noOfReviews: 200,
    price: 6.79,
    title: 'Mocha Latte Cafe',
    description:
        "Treat yourself to the indulgent Mocha Latte, combining rich espresso, steamed milk, and decadent chocolate for a delightful mocha experience. The perfect balance of coffee and chocolate creates a luscious and satisfying beverage.",
    addons: 'Chocolate',
    image: 'mocha_latte',
    coffeeType: "Latte",
  ),

  // Americano
  ProductModel(
    id: 10,
    ratings: 4.2,
    noOfReviews: 130,
    price: 3.79,
    title: 'Classic Americano',
    description:
        "Enjoy the simplicity of a Classic Americano, a strong and robust black coffee made by diluting espresso shots with hot water.",
    addons: 'None',
    image: 'classic_americano',
    coffeeType: "Americano",
  ),
  ProductModel(
    id: 11,
    ratings: 4.0,
    noOfReviews: 110,
    price: 4.29,
    title: 'Hazelnut Americano',
    description:
        "Add a nutty twist to your coffee routine with Hazelnut Americano, a flavorful black coffee infused with the essence of hazelnut.",
    addons: 'Hazelnut',
    image: 'hazelnut_americano',
    coffeeType: "Americano",
  ),
  ProductModel(
    id: 12,
    ratings: 4.4,
    noOfReviews: 150,
    price: 4.99,
    title: 'Caramel Americano',
    description:
        "Experience the perfect balance of bold coffee and sweet caramel with our Caramel Americano, a delightful black coffee with a hint of sweetness.",
    addons: 'Caramel',
    image: 'caramel_americano',
    coffeeType: "Americano",
  )
];
