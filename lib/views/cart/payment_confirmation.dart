import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rashi_network/utils/assets_names.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/text.dart';

class PaymentConfirmation extends StatelessWidget {
  const PaymentConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Payment Confirmation',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 700,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
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
                Navigator.pop(context);
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              label: Container(
                margin: const EdgeInsets.only(left: 4),
                child: const DesignText(
                  "Go Back",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: 700,
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  AssetsName.lottiesuccessanimation,
                  repeat: false,
                  height: 200,
                  width: 200,
                ),
                const DesignText(
                  'Congratulations !!! ',
                  fontSize: 20,
                  fontWeight: 600,
                ),
                const SizedBox(height: 6),
                const DesignText(
                  'Your Order has been placed \nSuccessfully',
                  fontSize: 16,
                  fontWeight: 400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
