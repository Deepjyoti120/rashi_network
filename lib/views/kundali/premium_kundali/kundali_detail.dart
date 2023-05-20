import 'package:flutter/material.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/views/cart/cart_details.dart';

class KundaliPremiumDetails extends StatefulWidget {
  const KundaliPremiumDetails({super.key});

  @override
  State<KundaliPremiumDetails> createState() => _KundaliPremiumDetailsState();
}

class _KundaliPremiumDetailsState extends State<KundaliPremiumDetails> {
  final PageController _controller = PageController(viewportFraction: 0.95);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Kundali Detail',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 700,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 152,
                    child: PageView.builder(
                        controller: _controller,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 1,
                                      color: DesignColor.lightGrey,
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.network(
                                      'https://thumbs.dreamstime.com/b/top-view-office-work-desk-laptop-diary-white-background-116998554.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DesignText(
                          'Premium Kundali Report',
                          fontSize: 15,
                          fontWeight: 700,
                        ),
                        // const DesignText(
                        //   'Represents Generosity     Weight :100 gram',
                        //   fontSize: 13,
                        //   fontWeight: 500,
                        //   color: DesignColor.lightGrey1,
                        // ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            DesignText(
                              '-10%',
                              fontSize: 18,
                              fontWeight: 500,
                              color: DesignColor.red,
                            ),
                            SizedBox(width: 6),
                            DesignText(
                              'Rs.1800',
                              fontSize: 20,
                              fontWeight: 700,
                            ),
                            SizedBox(width: 6),
                            DesignText(
                              'Rs.1200',
                              fontSize: 12,
                              fontWeight: 600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const DesignText(
                          'Services Included',
                          fontSize: 16,
                          fontWeight: 600,
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 4.0),
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Flexible(
                                  child: DesignText(
                                    "Horoscope $index",
                                    fontSize: 12,
                                    fontWeight: 300,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const DesignText(
                          'Languages Available',
                          fontSize: 16,
                          fontWeight: 600,
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 4.0),
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Flexible(
                                  child: DesignText(
                                    "Languages $index",
                                    fontSize: 12,
                                    fontWeight: 300,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: DesignButtons(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartDetails(),
                    ),
                  );
                },
                textLabel: 'Buy now',
                isTappedNotifier: ValueNotifier(false),
                colorText: Colors.white,
                fontSize: 16,
                fontWeight: 600,
                color: DesignColor.darkTeal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 6,
      width: currentPage == index ? 18 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF999999)
            : const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
