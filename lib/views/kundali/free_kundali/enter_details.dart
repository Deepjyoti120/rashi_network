import 'package:flutter/material.dart';
import 'package:rashi_network/ui/custom/custom_text_form.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/views/cart/payment_confirmation.dart';

class FreeKundaliEnterDetails extends StatefulWidget {
  const FreeKundaliEnterDetails({super.key});

  @override
  State<FreeKundaliEnterDetails> createState() =>
      _FreeKundaliEnterDetailsState();
}

class _FreeKundaliEnterDetailsState extends State<FreeKundaliEnterDetails> {
  bool isMale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Enter Details',
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
                  "Save",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: 700,
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter Name*',
              ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter birth date*',
              ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter birth time*',
              ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter birth location*',
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 54,
                child: Row(
                  children: [
                    Expanded(
                      child: DesignButtons(
                        onPressed: () async {
                          setState(() => isMale = false);
                        },
                        textLabel: 'Female',
                        isTappedNotifier: ValueNotifier(false),
                        sideWidth: 1,
                        colorText:
                            isMale ? DesignColor.darkTeal1 : Colors.white,
                        borderSide: true,
                        colorBorderSide: DesignColor.darkTeal1,
                        fontSize: 12,
                        fontWeight: 700,
                        color:
                            isMale ? Colors.transparent : DesignColor.darkTeal1,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DesignButtons(
                        onPressed: () async {
                          setState(() => isMale = true);
                        },
                        textLabel: 'Male',
                        isTappedNotifier: ValueNotifier(false),
                        sideWidth: 1,
                        colorText:
                            !isMale ? DesignColor.darkTeal1 : Colors.white,
                        borderSide: true,
                        colorBorderSide: DesignColor.darkTeal1,
                        fontSize: 12,
                        fontWeight: 700,
                        color: !isMale
                            ? Colors.transparent
                            : DesignColor.darkTeal1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
