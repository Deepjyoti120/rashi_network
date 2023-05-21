import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/ui/widgets/material_iconbtn.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/cart/cart_summary.dart';
import 'package:rashi_network/views/wallet/wallet_payment_confirmation.dart';

class PaymentInformation extends StatefulWidget {
  const PaymentInformation({super.key});

  @override
  State<PaymentInformation> createState() => _PaymentInformationState();
}

class _PaymentInformationState extends State<PaymentInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Payment Information',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: FloatingActionButton.extended(
              backgroundColor: DesignColor.darkTeal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WalletPaymentConfirmation(),
                  ),
                );
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              label: Container(
                margin: const EdgeInsets.only(left: 4),
                child: const DesignText(
                  "Proceed",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: 600,
                ),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const PriceSummaryCard(title: 'Recharge Amount', price: 'Rs.50'),
            const SizedBox(height: 6),
            const PriceSummaryCard(title: 'GST(18%)', price: 'Rs.9'),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DesignText(
                  'Payable Amount',
                  fontSize: 14,
                  fontWeight: 500,
                ),
                DesignText(
                  'Rs.59',
                  fontSize: 14,
                  fontWeight: 500,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: DesignColor.darkTeal)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: DesignText(
                        '100 % Extra on recharge of Rs 50',
                        fontSize: 14,
                        fontWeight: 500,
                        color: DesignColor.darkTeal,
                      ),
                    ),
                    MaterialIconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.done,
                  color: DesignColor.darkTeal,
                ),
                SizedBox(width: 6),
                Flexible(
                  child: DesignText(
                    'Rs.50 Cashback in wallet with this recharge',
                    fontSize: 14,
                    fontWeight: 500,
                    color: DesignColor.darkTeal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
