// import 'package:first_project/cart_screen.dart';
// import 'package:first_project/explore_screen.dart';
// import 'package:first_project/favourite_screen.dart';
// import 'package:first_project/home_screen.dart';
// import 'package:first_project/profile_screen.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _currentIndex = 0;

//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 5), () {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//   }

//   final List<Widget> _pages = [
//     HomeScreen(),
//     ExploreScreen(),
//     CartScreen(),
//     FavouriteScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [CircularProgressIndicator(color: Colors.grey)],
//           ),
//         ),
//       );
//     }

//     return buildHome(context);
//   }

//   Widget buildHome(BuildContext context) {
//     double myHeight = MediaQuery.of(context).size.height;
//     double myWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: Container(
//         height: myHeight * 0.1,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           boxShadow: [
//             BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 8),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           child: BottomNavigationBar(
//             backgroundColor: Colors.white,
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: Color(0xFF53B175),
//             unselectedItemColor: Colors.grey,
//             currentIndex: _currentIndex,
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.storefront),
//                 label: 'Shop',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.manage_search),
//                 label: 'Explore',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.shopping_cart_outlined),
//                 label: 'Cart',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite_border),
//                 label: 'Favourite',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person_outlined),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/home.dart
import 'package:first_project/cart_screen.dart';
import 'package:first_project/explore_screen.dart';
import 'package:first_project/favourite_screen.dart';
import 'package:first_project/home_screen.dart';
import 'package:first_project/profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool _isLoading = true;

  final List<Map<String, dynamic>> sections = [
    {
      "title": "Exclusive Offer",
      "products": [
        {
          "image": "assets/images/apple.png",
          "name": "Organic Banana",
          "desc": "1kg, Priceg",
          "price": "\$4.99",
          "detail":
              "Bananas are rich in potassium, improve digestion, and provide natural energy for daily activities.",
        },
        {
          "image": "assets/images/ginger.png",
          "name": "Red Apple",
          "desc": "1kg, Priceg",
          "price": "\$5.99",
          "detail":
              "Apples are nutritious, may be good for weight loss, support heart health, and fit into a healthy diet.",
        },
        {
          "image": "assets/images/bell_pepper.png",
          "name": "Red Apple",
          "desc": "1kg, Priceg",
          "price": "\$5.99",
          "detail":
              "Fresh red apples provide vitamins and antioxidants, perfect for snacks and desserts.",
        },
      ],
    },
    {
      "title": "Best Selling",
      "products": [
        {
          "image": "assets/images/apple.png",
          "name": "Fresh Orange",
          "desc": "1kg, Priceg",
          "price": "\$6.49",
          "detail":
              "Oranges are an excellent source of Vitamin C, boost immunity, and refresh your body.",
        },
        {
          "image": "assets/images/ginger.png",
          "name": "Pineapple",
          "desc": "1kg, Priceg",
          "price": "\$7.99",
          "detail":
              "Pineapples aid digestion, are full of Vitamin C, and add a tropical flavor to your meals.",
        },
        {
          "image": "assets/images/bell_pepper.png",
          "name": "Red Apple",
          "desc": "1kg, Priceg",
          "price": "\$5.99",
          "detail":
              "Crispy red apples rich in fiber and beneficial for digestive health.",
        },
      ],
    },
    {
      "title": "Groceries",
      "categories": [
        {
          "image": "assets/images/ngu_coc.png",
          "name": "Pulses",
          "color": 0xFFF8A44C,
        },
        {
          "image": "assets/images/rice.png",
          "name": "Rice",
          "color": 0xFF53B175,
        },
        {
          "image": "assets/images/apple.png",
          "name": "Dairy",
          "color": 0xFFD6E6F5,
        },
        {
          "image": "assets/images/apple.png",
          "name": "Meat",
          "color": 0xFFFFF2CC,
        },
      ],
      "products": [
        {
          "image": "assets/images/apple.png",
          "name": "Carrot",
          "desc": "1kg, Priceg",
          "price": "\$3.50",
          "detail":
              "Carrots are high in beta-carotene, improve vision, and are great for cooking or raw salads.",
        },
        {
          "image": "assets/images/ginger.png",
          "name": "Potato",
          "desc": "1kg, Priceg",
          "price": "\$2.80",
          "detail":
              "Potatoes are versatile, rich in carbohydrates, and provide energy for your daily needs.",
        },
        {
          "image": "assets/images/bell_pepper.png",
          "name": "Red Apple",
          "desc": "1kg, Priceg",
          "price": "\$5.99",
          "detail":
              "Juicy and sweet red apples, perfect for desserts, juices, or healthy snacking.",
        },
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;

    final List<Widget> pages = [
      HomeScreen(sections: sections),
      const ExploreScreen(),
      const CartScreen(),
      const FavouriteScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body:
          _isLoading
              ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(color: Colors.grey),
                    ],
                  ),
                ),
              )
              : pages[_currentIndex],
      bottomNavigationBar:
          !_isLoading
              ? Container(
                height: myHeight * 0.1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: const Color(0xFF53B175),
                    unselectedItemColor: Colors.grey,
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.storefront),
                        label: 'Shop',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.manage_search),
                        label: 'Explore',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border),
                        label: 'Favourite',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outlined),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              )
              : null,
    );
  }
}
