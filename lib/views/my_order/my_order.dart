import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/my_order/my_order_summary.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'My Orders',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 600,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 8,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyorderSummary(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: DesignContainer(
                  blurRadius: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Image.network(
                          'https://media.licdn.com/dms/image/C5103AQHp4cT0ddqm_Q/profile-displayphoto-shrink_800_800/0/1578716401072?e=2147483647&v=beta&t=JS78CQMdQodi4t4Oz9IXlj6Ls0NBAZ7FV8ON-Ujpq8U',
                          height: 83,
                          width: 83,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              DesignText(
                                '7 Ratti Evil Eye',
                                fontSize: 12,
                                fontWeight: 600,
                              ),
                              DesignText(
                                'Delivery on: 28th April 2023 ',
                                fontSize: 12,
                                fontWeight: 400,
                              ),
                              DesignText(
                                'Ordered on : 26th April 2023 ',
                                fontSize: 12,
                                fontWeight: 400,
                              ),
                              DesignText(
                                'Rs.3400',
                                fontSize: 12,
                                fontWeight: 600,
                              ),
                              DesignText(
                                'Delievered',
                                fontSize: 12,
                                fontWeight: 500,
                                color: DesignColor.darkTeal,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
