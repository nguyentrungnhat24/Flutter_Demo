// import 'package:first_project/home.dart';
// import 'package:flutter/material.dart';

// class Detail extends StatefulWidget {
//   const Detail({super.key});

//   @override
//   State<Detail> createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               height: 371.44,
//               width: 413.6,
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(25),
//                       bottomRight: Radius.circular(25),
//                     ),
//                     child: Image.asset(
//                       'assets/Rectangle 69.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 30, 15, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           iconSize: 40,
//                           onPressed: onBackClick,
//                           icon: Icon(Icons.chevron_left),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Image.asset("assets/images/Vector.png"),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Image.asset('assets/images/Group 6829.png'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Image.asset('assets/images/pngfuel 1 1.png'),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset('assets/images/apple.png'),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Naturel Red Apple",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                             child: Text(
//                               "1kg, Price",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Color(0xFF7C7C7C),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                         child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.favorite_border),
//                           color: const Color.fromARGB(255, 121, 116, 116),
//                           iconSize: 25,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(5, 25, 20, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.remove),
//                             color: const Color.fromARGB(255, 121, 116, 116),
//                             iconSize: 20,
//                           ),
//                           Container(
//                             width: 45.67,
//                             height: 45.67,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(17),
//                               ),
//                               border: Border.all(
//                                 color: const Color.fromARGB(255, 216, 210, 210),
//                               ),
//                             ),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "1",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.add),
//                             color: const Color.fromARGB(255, 121, 116, 116),
//                             iconSize: 20,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "\$4.99",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//                   child: Column(
//                     children: [
//                       Divider(color: Color(0xE2E2E2B2), thickness: 1),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Product Detail",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 height: 18 / 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               padding: EdgeInsets.zero,
//                               constraints: BoxConstraints(),
//                               iconSize: 30,
//                               onPressed: () {},
//                               icon: Icon(Icons.expand_more),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         "Apples Are Nutritious. " +
//                             "Apples May Be Good For Weight Loss. " +
//                             "Apples May Be Good For Your Heart. " +
//                             "As Part Of A Healtful And Varied Diet.",
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Color(0xff7c7c7c),
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                         child: Divider(color: Color(0xE2E2E2B2), thickness: 1),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Nutritions",
//                             style: TextStyle(
//                               fontSize: 16,
//                               height: 18 / 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: 33.61,
//                                 height: 18,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 218, 214, 214),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(5),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "100gr",
//                                   style: TextStyle(
//                                     color: Color(0xff7c7c7c),
//                                     fontSize: 9,
//                                     height: 13.5 / 9,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: BoxConstraints(),
//                                 iconSize: 30,
//                                 onPressed: () {},
//                                 icon: Icon(Icons.chevron_right),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),

//                       Divider(color: Color(0xE2E2E2B2), thickness: 1),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Review",
//                             style: TextStyle(
//                               fontSize: 16,
//                               height: 18 / 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: List.generate(
//                                   5,
//                                   (index) => const Icon(
//                                     Icons.star,
//                                     color: Color(0xFFF3603F),
//                                     size: 15,
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: BoxConstraints(),
//                                 iconSize: 30,
//                                 onPressed: () {},
//                                 icon: Icon(Icons.chevron_right),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),

//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
//                         child: SizedBox(
//                           width: double.infinity,
//                           height: 67,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF53B175),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(16),
//                                 ),
//                               ),
//                             ),
//                             child: Text(
//                               "Add To Basket",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void onBackClick() {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//   }
// }

import 'package:first_project/cubit/product_cubit.dart';
import 'package:first_project/models/product.dart';
import 'package:first_project/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detail extends StatelessWidget {
  final Product product;
  const Detail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => ProductCubit(product),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();

          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 371,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          // child: Image.asset(
                          //   state.product.image,
                          //   fit: BoxFit.cover,
                          //   width: double.infinity,
                          // ),
                          // child: Image.asset(
                          //   'assets/Rectangle 69.png',
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                iconSize: 40,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Home(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.chevron_left),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset("assets/images/Vector.png"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/Group 6829.png'),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                        //   child: Align(
                        //     alignment: Alignment.center,
                        //     child: Image.asset('assets/images/pngfuel 1 1.png'),
                        //   ),
                        // ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            state.product.image,
                            fit: BoxFit.contain,
                            width: myWidth * 0.8,
                            height: myHeight * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Nội dung bên dưới
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Tên + desc
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.product.name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      state.product.desc,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF7C7C7C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: cubit.toggleLike,
                                  icon: Icon(
                                    state.isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // Quantity + Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: cubit.decreaseQuantity,
                                      icon: const Icon(Icons.remove),
                                      color: Colors.grey,
                                      iconSize: 20,
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(17),
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${state.quantity}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: cubit.increaseQuantity,
                                      icon: const Icon(Icons.add),
                                      color: Colors.grey,
                                      iconSize: 20,
                                    ),
                                  ],
                                ),
                                Text(
                                  state.product.price,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            const Divider(
                              color: Color(0xFFE2E2E2),
                              thickness: 1,
                            ),

                            // Product Detail
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Product Detail",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.expand_more),
                                ),
                              ],
                            ),
                            Text(
                              state.product.detail,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xff7c7c7c),
                                fontWeight: FontWeight.w300,
                              ),
                            ),

                            const SizedBox(height: 10),
                            const Divider(
                              color: Color(0xFFE2E2E2),
                              thickness: 1,
                            ),

                            // Nutrition
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nutritions",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        "100gr",
                                        style: TextStyle(
                                          color: Color(0xff7c7c7c),
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.chevron_right),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const Divider(
                              color: Color(0xFFE2E2E2),
                              thickness: 1,
                            ),

                            // Review
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Review",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => const Icon(
                                          Icons.star,
                                          color: Color(0xFFF3603F),
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.chevron_right),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // Add to Basket button
                            SizedBox(
                              width: double.infinity,
                              height: 67,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF53B175),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text(
                                  "Add To Basket",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
