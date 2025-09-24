import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.shopping_bag_outlined, "name": "Orders"},
    {"icon": Icons.badge_outlined, "name": "My Details"},
    {"icon": Icons.location_on_outlined, "name": "Delivery Address"},
    {"icon": Icons.payment_outlined, "name": "Payment Methods"},
    {"icon": Icons.confirmation_num_outlined, "name": "Promo Cord"},
    {"icon": Icons.notifications_outlined, "name": "Notifications"},
    {"icon": Icons.help_outline, "name": "Help"},
    {"icon": Icons.info_outline, "name": "About"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image(
                        image: AssetImage("assets/images/avatar.png"),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Afsar Hossen",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF181725),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Color(0xFF53B175),
                            ),
                          ],
                        ),
                        const Text(
                          "Imshuvo97@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7C7C7C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Divider(),
              ),
              Column(
                children: List.generate(menuItems.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(menuItems[index]["icon"]),
                                const SizedBox(width: 14),
                                Text(
                                  menuItems[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF181725),
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 364,
                height: 67,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2F3F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: Color(0xFF53B175),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF53B175),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
