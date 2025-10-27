import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Nastea', style: NasteaTextStyles.heading()),
        actions: [
          Container(
            width: 38,
            height: 38,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7F9),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFD8DADC), width: 1),
            ),
            child: Center(child: Icon(Icons.notifications_none_rounded)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20),
            Text(
              '7 venters owing you',
              style: NasteaTextStyles.body(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Text(
              'INR 142,645',
              style: NasteaTextStyles.body(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(35),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF46A56C),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const BillCreationScreen(),
                      //   ),
                      // );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.add, color: Colors.white),
                        Image.asset(
                          'assets/images/bill_icon.png',
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        
                        
                        Gap(10),
                        Text(
                          'Create Bill',
                          style: NasteaTextStyles.body(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(20),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFFFF8E1),
                      foregroundColor: Color(0xFF795548),
                      minimumSize: Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(color: Color(0xFF795548), width: 1),
                      ),

                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      //todo View history screen
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xFF795548)),
                        Gap(10),
                        Text(
                          'View History',
                          style: NasteaTextStyles.body(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF795548),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  border: Border.all(color: Color(0xFFD8DADC)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      "Bills History",
                      style: NasteaTextStyles.body(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(11),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F8FA),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xFFD8DADC)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Color(0xFFD9D9D9),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Gap(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Arun Franklin',
                                          style: NasteaTextStyles.body(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Dec 2, 2023 • 07:30 PM',
                                          style: NasteaTextStyles.body(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(12),
                                Divider(color: Color(0xFFD8DADC), height: 1),
                                Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Total ',
                                        style: NasteaTextStyles.body(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'INR 4,500',
                                            style: NasteaTextStyles.body(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF3E0),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: Text(
                                        'Pending',
                                        style: NasteaTextStyles.body(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFF6D00),
                                        ),
                                      ),
                                    ),
                                  ],
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 5,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_outlined),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history_rounded),
            label: 'History',
          ),
        ],
      ),
    );
  }


}
