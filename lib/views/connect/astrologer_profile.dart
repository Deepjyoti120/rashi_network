import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/model/astrologer_model.dart';
import 'package:rashi_network/views/connect/chat/chat_screen.dart';

class AstrologerProfile extends StatefulWidget {
  const AstrologerProfile(
      {super.key, required this.index, required this.astrologerModel});
  final int index;
  final AstrologerModel astrologerModel;
  @override
  State<AstrologerProfile> createState() => _AstrologerProfileState();
}

class _AstrologerProfileState extends State<AstrologerProfile> {
  @override
  Widget build(BuildContext context) {
    var document = parse(widget.astrologerModel.longbio!);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Astrologer Profile',
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
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              label: const DesignText(
                "Chat now",
                color: Colors.white,
                fontSize: 14,
                fontWeight: 600,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DesignContainer(
                color: DesignColor.white,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Hero(
                          tag: widget.index,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.green),
                              borderRadius: BorderRadius.circular(
                                  60), // assuming height/width is 83
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                'https://thetaramandal.com/public/astrologer/${widget.astrologerModel.photo!}',
                                height: 83,
                                width: 83,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: DesignText(
                                '⭐',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DesignText(
                            widget.astrologerModel.name!,
                            fontSize: 12,
                            fontWeight: 600,
                          ),
                          DesignText(
                            'Vaastu, Horoscope',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.lightGrey1,
                          ),
                          DesignText(
                            'Hindi, English',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.lightGrey1,
                          ),
                          DesignText(
                            '5 Years',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.lightGrey1,
                          ),
                          DesignText(
                            'Rs.10/Min',
                            fontSize: 10,
                            fontWeight: 500,
                            color: DesignColor.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const DesignText(
                'Skills',
                fontSize: 15,
                fontWeight: 700,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: DesignContainer(
                        borderAllColor: DesignColor.gold,
                        bordered: true,
                        allPadding: 6,
                        alignment: Alignment.center,
                        child: DesignText(
                          'Tarot',
                          fontSize: 12,
                          fontWeight: 500,
                          color: DesignColor.gold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const DesignText(
                'About me',
                fontSize: 16,
                fontWeight: 600,
              ),
              const SizedBox(height: 10),
              DesignText(
                widget.astrologerModel.longbio ?? '',
                fontSize: 11,
                fontWeight: 400,
              ),
              DesignText(
                document.body!.text,
                fontSize: 11,
                fontWeight: 400,
              ),
              // HtmlWidget(
              //   widget.astrologerModel.longbio!,
              //   textStyle: const TextStyle(
              //     fontSize: 11,
              //     fontWeight: FontWeight.w400,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
              const SizedBox(height: 20),
              const DesignText(
                'Customer Reviews',
                fontSize: 16,
                fontWeight: 600,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: DesignText('⭐'),
                          ),
                        ),
                      ),
                      const DesignText(
                        'Good Stone',
                        fontSize: 11,
                        fontWeight: 400,
                      ),
                    ],
                  ),
                  const DesignText(
                    'Nov 2020',
                    fontSize: 10,
                    fontWeight: 500,
                    color: DesignColor.lightGrey2,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
