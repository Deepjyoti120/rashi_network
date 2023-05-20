import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/ui/custom/design_single_tap.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/connect/astrologer_profile.dart';

class CallHistory extends ConsumerStatefulWidget {
  const CallHistory({super.key});

  @override
  ConsumerState<CallHistory> createState() => _CallHistoryState();
}

class _CallHistoryState extends ConsumerState<CallHistory> {
  @override
  Widget build(BuildContext context) {
    final appStateauto = ref.watch(appStateautoDispose);
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   backgroundColor: DesignColor.darkTeal2,
      //   title: const DesignText(
      //     'Call',
      //     color: Colors.white,
      //     fontSize: 20,
      //     fontWeight: 700,
      //   ),
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(20),
      //     ),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      //     const SizedBox(width: 14),
      //   ],
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () => appStateauto.currentIndex = 0,
      //   ),
      // ),
    
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return DesignSingleTap(
            isTappedNotifier: ValueNotifier(false),
            onTap: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AstrologerProfile(index: index),
              //   ),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DesignContainer(
                color: DesignColor.white,
                // height: 140,
                child: Row(
                  children: [
                    Hero(
                      tag: 'Call$index',
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.green),
                          borderRadius: BorderRadius.circular(
                              60), // assuming height/width is 83
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2023/01/28/16/55/woman-7751363_960_720.jpg',
                            height: 83,
                            width: 83,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const DesignText(
                                'Astro Kunal Khemu',
                                fontSize: 12,
                                fontWeight: 600,
                              ),
                              SizedBox(
                                height: 20,
                                child: ListView.builder(
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      const Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: DesignText('⭐'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const DesignText(
                            'Vaastu, Horoscope',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.lightGrey1,
                          ),
                          const DesignText(
                            'Hindi, English',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.lightGrey1,
                          ),
                          const DesignText(
                            '5 Years',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.lightGrey1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const DesignText(
                                'Rs.10/Min',
                                fontSize: 10,
                                fontWeight: 500,
                                color: DesignColor.red,
                              ),
                              SizedBox(
                                height: 31,
                                width: 81,
                                child: DesignButtons(
                                  onPressed: () async {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ChatScreen(),
                                    //     ));
                                  },
                                  textLabel: 'Call',
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
                          ),
                          const DesignText(
                            'Completed',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.green,
                          ),
                        ],
                      ),
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
