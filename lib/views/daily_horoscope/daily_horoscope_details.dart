import 'package:flutter/material.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/views/cart/cart_details.dart';

class DailyHoroscopeDetails extends StatefulWidget {
  const DailyHoroscopeDetails({super.key});

  @override
  State<DailyHoroscopeDetails> createState() => _DailyHoroscopeDetailsState();
}

class _DailyHoroscopeDetailsState extends State<DailyHoroscopeDetails> {
  final PageController _controller = PageController(viewportFraction: 0.95);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Aries',
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
                                      'https://play-lh.googleusercontent.com/ndpkgaw3iN2Ocw2TCvY-5G2cE7Bz3iqx7UiLjalS6logfC9zs91Hp8J0aZJjuMxc6nLt=w240-h480-rw',
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(
                  //     4,
                  //     (index) => buildDot(index: index),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        DesignText(
                          'Aries',
                          fontSize: 15,
                          fontWeight: 700,
                        ),
                        DesignText(
                          '08 May 2023- 7 June 2023',
                          fontSize: 13,
                          fontWeight: 500,
                          color: DesignColor.lightGrey1,
                        ),
                        SizedBox(height: 20),
                        DesignText(
                          'Personal Life',
                          fontSize: 16,
                          fontWeight: 600,
                        ),
                        SizedBox(height: 10),
                        DesignText(
                          "Better Things are about to pop up at the horizon, this day may prove to be a day of change for natives of gemini. The horoscope for the day is full of optimism, good energy and enthusiasm in regards to your love life. ",
                          fontSize: 11,
                          fontWeight: 400,
                        ),
                        SizedBox(height: 20),
                        DesignText(
                          'Profession',
                          fontSize: 16,
                          fontWeight: 600,
                        ),
                        SizedBox(height: 10),
                        DesignText(
                          "Better Things are about to pop up at the horizon, this day may prove to be a day of change for natives of gemini. The horoscope for the day is full of optimism, good energy and enthusiasm in regards to your love life. ",
                          fontSize: 11,
                          fontWeight: 400,
                        ),
                        SizedBox(height: 20),
                        DesignText(
                          'Emotions',
                          fontSize: 16,
                          fontWeight: 600,
                        ),
                        SizedBox(height: 10),
                        DesignText(
                          "Life will be full of love. Fun and excitement. You will experience feelings of peace and satisfaction.",
                          fontSize: 11,
                          fontWeight: 400,
                        ),
                        SizedBox(height: 20),
                        DesignText(
                          'Luck',
                          fontSize: 16,
                          fontWeight: 600,
                        ),
                        SizedBox(height: 10),
                        DesignText(
                          "Today’s luck is quotient for you is good. There are no bad afflictions or inauspicious results.",
                          fontSize: 11,
                          fontWeight: 400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          //   child: SizedBox(
          //     height: 48,
          //     width: double.infinity,
          //     child: DesignButtons(
          //       onPressed: () async {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const CartDetails(),
          //           ),
          //         );
          //       },
          //       textLabel: 'Buy now',
          //       isTappedNotifier: ValueNotifier(false),
          //       colorText: Colors.white,
          //       fontSize: 16,
          //       fontWeight: 600,
          //       color: DesignColor.darkTeal,
          //     ),
          //   ),
          // ),
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
