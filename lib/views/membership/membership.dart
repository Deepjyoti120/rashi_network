import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/membership/membership_details.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Buy Membership',
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
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [DesignColor.pink, DesignColor.lightBlue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: DesignColor.lightGrey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DesignText(
                      'Deal of the day',
                      fontSize: 16,
                      fontWeight: 600,
                      decoration: TextDecoration.underline,
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      itemCount: 2,
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
                                "Enjoy a free chat session $index",
                                fontSize: 12,
                                fontWeight: 300,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const Divider(color: DesignColor.darkTeal, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DesignText(
                          'Rs.500',
                          fontSize: 18,
                          fontWeight: 700,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: DesignButtons(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MembershipDetails(),
                                  ));
                            },
                            textLabel: 'Buy now',
                            isTappedNotifier: ValueNotifier(false),
                            sideWidth: 1,
                            colorText: DesignColor.darkTeal1,
                            borderSide: true,
                            colorBorderSide: DesignColor.darkTeal1,
                            fontSize: 12,
                            pdleft: 18,
                            pdright: 18,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
