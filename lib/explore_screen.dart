import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // Dữ liệu cho GridView
  final List<Map<String, dynamic>> items = [
    {
      "bgColor": Color.fromARGB(255, 225, 251, 237),
      "borderColor": Color.fromARGB(255, 88, 218, 105),
      "image": "assets/images/vegetable.png",
      "name": "Fresh Fruits & Vegetable",
    },
    {
      "bgColor": Color(0xFFFFF2CC),
      "borderColor": Color(0xFFE6C94D),
      "image": "assets/images/oil.png",
      "name": "Cooking Oil & Ghee",
    },
    {
      "bgColor": Color.fromARGB(255, 214, 228, 242),
      "borderColor": Color(0xFF91C0F2),
      "image": "assets/images/meatfish.png",
      "name": "Meat & Fish",
    },
    {
      "bgColor": Color.fromARGB(255, 245, 213, 178),
      "borderColor": Color(0xFFE78A32),
      "image": "assets/images/bakery.png",
      "name": "Bakery & Snacks",
    },
    {
      "bgColor": Color.fromARGB(255, 197, 251, 217),
      "borderColor": Color(0xFF3E9356),
      "image": "assets/images/dairy.png",
      "name": "Dairy & Eggs",
    },
    {
      "bgColor": Color.fromARGB(255, 255, 203, 203),
      "borderColor": Color.fromARGB(255, 206, 82, 82),
      "image": "assets/images/beverages.png",
      "name": "Beverages",
    },
    {
      "bgColor": Color(0xFFD1F0FF),
      "borderColor": Color(0xFF89D1FF),
      "image": "assets/images/apple.png",
      "name": "Apple",
    },
    {
      "bgColor": Color(0xFFE5E5E5),
      "borderColor": Color(0xFFBFBFBF),
      "image": "assets/images/ginger.png",
      "name": "Ginger",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "Find Products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF181725),
                ),
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
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 175 / 190,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    color: item["bgColor"],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: item["borderColor"], width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Image.asset(
                            item["image"],
                            width: 111,
                            height: 95,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
