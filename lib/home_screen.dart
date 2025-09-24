import 'package:first_project/models/product.dart';
import 'package:first_project/product_detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});

  final List<Map<String, dynamic>> sections;
  const HomeScreen({super.key, required this.sections});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<Map<String, dynamic>> sections = [
  //   {
  //     "title": "Exclusive Offer",
  //     "products": [
  //       {
  //         "image": "assets/images/apple.png",
  //         "name": "Organic Banana",
  //         "desc": "1kg, Priceg",
  //         "price": "\$4.99",
  //       },
  //       {
  //         "image": "assets/images/ginger.png",
  //         "name": "Red Apple",
  //         "desc": "1kg, Priceg",
  //         "price": "\$5.99",
  //       },
  //       {
  //         "image": "assets/images/bell_pepper.png",
  //         "name": "Red Apple",
  //         "desc": "1kg, Priceg",
  //         "price": "\$5.99",
  //       },
  //     ],
  //   },
  //   {
  //     "title": "Best Selling",
  //     "products": [
  //       {
  //         "image": "assets/images/apple.png",
  //         "name": "Fresh Orange",
  //         "desc": "1kg, Priceg",
  //         "price": "\$6.49",
  //       },
  //       {
  //         "image": "assets/images/ginger.png",
  //         "name": "Pineapple",
  //         "desc": "1kg, Priceg",
  //         "price": "\$7.99",
  //       },
  //       {
  //         "image": "assets/images/bell_pepper.png",
  //         "name": "Red Apple",
  //         "desc": "1kg, Priceg",
  //         "price": "\$5.99",
  //       },
  //     ],
  //   },
  //   {
  //     "title": "Groceries",
  //     "categories": [
  //       {
  //         "image": "assets/images/ngu_coc.png",
  //         "name": "Pulses",
  //         "color": 0xFFF8A44C,
  //       },
  //       {
  //         "image": "assets/images/rice.png",
  //         "name": "Rice",
  //         "color": 0xFF53B175,
  //       },
  //       {
  //         "image": "assets/images/apple.png",
  //         "name": "Dairy",
  //         "color": 0xFFD6E6F5,
  //       },
  //       {
  //         "image": "assets/images/apple.png",
  //         "name": "Meat",
  //         "color": 0xFFFFF2CC,
  //       },
  //     ],
  //     "products": [
  //       {
  //         "image": "assets/images/apple.png",
  //         "name": "Carrot",
  //         "desc": "1kg, Priceg",
  //         "price": "\$3.50",
  //       },
  //       {
  //         "image": "assets/images/ginger.png",
  //         "name": "Potato",
  //         "desc": "1kg, Priceg",
  //         "price": "\$2.80",
  //       },
  //       {
  //         "image": "assets/images/bell_pepper.png",
  //         "name": "Red Apple",
  //         "desc": "1kg, Priceg",
  //         "price": "\$5.99",
  //       },
  //     ],
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    final sections = widget.sections;
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/Group.png')
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Image(
                image: AssetImage('assets/images/Group.png'),
                width: myWidth * 0.05,
                height: myHeight * 0.05,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Color(0xFF4C4F4D)),
                  Text(
                    " Dhaka, Banassre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4C4F4D),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Store",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF2F3F2),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
              child: Image(
                image: AssetImage('assets/images/banner.png'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: sections.length,
                  itemBuilder: (context, sectionIndex) {
                    final section = sections[sectionIndex];
                    final products =
                        section["products"] as List<Map<String, String>>;
                    // print(sectionIndex);
                    // print(section);
                    print(products);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tiêu đề section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              section["title"],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF181725),
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF53B175),
                              ),
                            ),
                          ],
                        ),
                        // nếu Groceries hiển thị categories
                        if (section["title"] == "Groceries")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 105,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (section["categories"] as List).length,
                                itemBuilder: (context, index) {
                                  final category = section["categories"][index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Container(
                                      width: 248,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        color: Color(category["color"]),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Image.asset(
                                              category["image"]!,
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              category["name"]!,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF3E423F),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                        //  ListView ngang sản phẩm
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                          child: SizedBox(
                            height: 248,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    width: 173,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        final productObj = Product(
                                          name: product["name"]!,
                                          desc: product["desc"]!,
                                          image: product["image"]!,
                                          price: product["price"]!,
                                          detail: product["detail"]!,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    Detail(product: productObj),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          side: BorderSide(
                                            color: Color.fromARGB(
                                              255,
                                              236,
                                              235,
                                              235,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 16,
                                                ),
                                                child: Image.asset(
                                                  product["image"]!,
                                                  width: 103,
                                                  height: 62,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 24,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    product["name"]!,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF181725),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 12,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    product["desc"]!,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF7C7C7C),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 16,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      product["price"]!,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color(
                                                          0xFF181725,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 45,
                                                      height: 45,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(0xFF53B175),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  16,
                                                                ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                        child: Icon(
                                                          Icons.add_rounded,
                                                          size: 32,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
