import 'package:flutter/material.dart';
import 'package:rashi_network/services/api/api_access.dart';
import 'package:rashi_network/ui/custom/design_single_tap.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/ui/widgets/progress_circle.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/model/live_astrologer.dart';
import 'package:rashi_network/views/connect/astrologer_profile.dart';
import 'package:rashi_network/views/connect/chat/chat_screen.dart';

class LiveAstrologer extends StatefulWidget {
  const LiveAstrologer({super.key});

  @override
  State<LiveAstrologer> createState() => _LiveAstrologerState();
}

class _LiveAstrologerState extends State<LiveAstrologer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Live Astrologers',
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
      body: FutureBuilder<List<LiveAstrologerModel>>(
          future: ApiAccess().liveAstrologer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final snap = snapshot.data!;
              return ListView.builder(
                itemCount: snap.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final livedata = snap[index];
                  return DesignSingleTap(
                    isTappedNotifier: ValueNotifier(false),
                    onTap: () async {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AstrologerProfile(
                      //         index: index, astrologerModel: livedata),
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
                              tag: index,
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.green),
                                  borderRadius: BorderRadius.circular(
                                      60), // assuming height/width is 83
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    'https://thetaramandal.com/public/astrologer/${livedata.photo}',
                                    height: 83,
                                    width: 83,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: DesignText(
                                          livedata.name!,
                                          fontSize: 12,
                                          fontWeight: 600,
                                        ),
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
                                    'Vaastu, Horoscope', // in Live api Currently no data available like: Vaastu, Horoscope, Last Checked: 19/05/2023 Time: 1:02 PM
                                    fontSize: 10,
                                    fontWeight: 500,
                                    color: DesignColor.lightGrey1,
                                  ),
                                  const DesignText(
                                    'Hindi, English', // in Live api Currently no data available like: Language, Last Checked: 19/05/2023 Time: 1:02 PM i got  "language": "1,2",
                                    fontSize: 10,
                                    fontWeight: 500,
                                    color: DesignColor.lightGrey1,
                                  ),
                                  DesignText(
                                    '${livedata.experience} Years',

                                    /// in some astrologerhave `NUll` Experiece Last Checked: 19/05/2023 Time: 1:02 PM
                                    fontSize: 10,
                                    fontWeight: 500,
                                    color: DesignColor.lightGrey1,
                                  ),
                                  Row(
                                    children: [
                                      DesignText(
                                        'Rs.${livedata.callPrice}/Min',
                                        fontSize: 10,
                                        fontWeight: 500,
                                        color: DesignColor.red,
                                      ),
                                      //   DesignText(
                                      //    'Rs.${livedata.chatPrice}/Min',// 'chat_price'  Last Checked: 19/05/2023 Time: 1:07 PM ; on every field i got NUll Value
                                      //   fontSize: 10,
                                      //   fontWeight: 500,
                                      //   color: DesignColor.red,
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (livedata.call! == 'Yes')
                                        SizedBox(
                                          height: 31,
                                          width: 81,
                                          child: DesignButtons(
                                            onPressed: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ChatScreen(),
                                                  ));
                                            },
                                            textLabel: 'Call',
                                            isTappedNotifier:
                                                ValueNotifier(false),
                                            sideWidth: 1,
                                            colorText: Colors.white,
                                            borderSide: true,
                                            colorBorderSide:
                                                DesignColor.darkTeal1,
                                            fontSize: 12,
                                            fontWeight: 700,
                                            color: DesignColor.darkTeal1,
                                          ),
                                        ),
                                      if (livedata.chat! == 'Yes')
                                        const SizedBox(width: 8),
                                      if (livedata.chat! == 'Yes')
                                        SizedBox(
                                          height: 31,
                                          width: 81,
                                          child: DesignButtons(
                                            onPressed: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ChatScreen(),
                                                  ));
                                            },
                                            textLabel: 'Chat',
                                            isTappedNotifier:
                                                ValueNotifier(false),
                                            sideWidth: 1,
                                            colorText: DesignColor.darkTeal1,
                                            borderSide: true,
                                            colorBorderSide:
                                                DesignColor.darkTeal1,
                                            fontSize: 12,
                                            fontWeight: 700,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: DesignProgress(),
              );
            }
          }),
    );
  }
}
