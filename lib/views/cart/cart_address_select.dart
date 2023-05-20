import 'package:flutter/material.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/views/address/add_address.dart';
import 'package:rashi_network/views/cart/payment_confirmation.dart';

class CartAddress extends StatefulWidget {
  const CartAddress({super.key});

  @override
  State<CartAddress> createState() => _CartAddressState();
}

class _CartAddressState extends State<CartAddress> {
  int iiiii = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Select Address',
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
                      builder: (context) => const PaymentConfirmation(),
                    ));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 60),
          child: Column(
            children: [
              SizedBox(
                height: 56,
                width: double.infinity,
                child: DesignButtons(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddAddress(),
                      ),
                    );
                  },
                  textLabel: 'Add New Address',
                  isTappedNotifier: ValueNotifier(false),
                  colorText: DesignColor.darkTeal,
                  fontSize: 16,
                  fontWeight: 700,
                  colorBorderSide: DesignColor.darkTeal,
                  borderSide: true,
                  color: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 12,
                              width: 20,
                              child: Radio(
                                activeColor: DesignColor.darkTeal,
                                value: index == iiiii,
                                groupValue: true,
                                onChanged: (value) {
                                  setState(() {
                                    iiiii = index;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            const DesignText(
                              'Deepak Jha ',
                              fontSize: 14,
                              fontWeight: 700,
                            ),
                            const DesignText(
                              '(Default)',
                              fontSize: 10,
                              fontWeight: 700,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const DesignText(
                          'Sai Siddhi Building Kajupada, Abhinav Nagar,Borivali EastMumbai, Maharashtra 400066',
                          fontSize: 11,
                          fontWeight: 400,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            DesignText(
                              'Mobile No: ',
                              fontSize: 11,
                              fontWeight: 400,
                            ),
                            DesignText(
                              '3849385968',
                              fontSize: 11,
                              fontWeight: 600,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(
                              height: 31,
                              width: 81,
                              child: DesignButtons(
                                onPressed: () async {},
                                textLabel: 'Edit',
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
