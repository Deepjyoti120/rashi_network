import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';

class FreeKundaliDetails extends StatefulWidget {
  const FreeKundaliDetails({super.key});

  @override
  State<FreeKundaliDetails> createState() => _FreeKundaliDetailsState();
}

class _FreeKundaliDetailsState extends State<FreeKundaliDetails> {
  List<String> dataInfo = [
    'Basic',
    'Lagan',
    'Planetary',
    'Dasha',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Results',
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 34,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataInfo.length,
                itemBuilder: (context, index) {
                  String st = dataInfo[index];
                  bool isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: SizedBox(
                      height: 31,
                      width: 81,
                      child: DesignButtons(
                        onPressed: () async {
                          setState(() => selectedIndex = index);
                        },
                        textLabel: st,
                        isTappedNotifier: ValueNotifier(false),
                        sideWidth: 1,
                        colorText: isSelected
                            ? DesignColor.darkGrey
                            : DesignColor.gold,
                        borderSide: true,
                        colorBorderSide: DesignColor.gold,
                        fontSize: 12,
                        fontWeight: 700,
                        color:
                            isSelected ? DesignColor.gold : Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
