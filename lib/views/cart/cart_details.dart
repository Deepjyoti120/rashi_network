import 'package:flutter/material.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/views/cart/cart_summary.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Cart Details',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: FloatingActionButton.extended(
              backgroundColor: DesignColor.darkTeal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartSummary(),
                  ),
                );
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              label: Container(
                margin: const EdgeInsets.only(left: 4),
                child: const DesignText(
                  "Continue",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: 700,
                ),
              )),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
        itemBuilder: (context, index) {
          return Padding(
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
                        'https://cdn.pixabay.com/photo/2023/01/28/16/55/woman-7751363_960_720.jpg',
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
                              'Rs.3400',
                              fontSize: 14,
                              fontWeight: 700,
                            ),
                            DesignText(
                              'Weight: 100 grams',
                              fontSize: 12,
                              fontWeight: 500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              height: 31,
                              width: 81,
                              child: DesignButtons(
                                onPressed: () async {},
                                textLabel: 'Add',
                                isTappedNotifier: ValueNotifier(false),
                                sideWidth: 1,
                                colorText: DesignColor.darkTeal1,
                                borderSide: true,
                                colorBorderSide: DesignColor.darkTeal1,
                                fontSize: 12,
                                fontWeight: 700,
                                color: Colors.transparent,
                              ),
                            ),
                            const SizedBox(width: 6),
                            SizedBox(
                              height: 31,
                              width: 81,
                              child: DesignButtons(
                                onPressed: () async {},
                                textLabel: 'Remove',
                                isTappedNotifier: ValueNotifier(false),
                                sideWidth: 1,
                                colorText: DesignColor.darkTeal1,
                                borderSide: true,
                                colorBorderSide: DesignColor.darkTeal1,
                                fontSize: 12,
                                fontWeight: 700,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
