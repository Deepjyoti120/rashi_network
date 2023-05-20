import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/reikhi_healing/reikhi_healing_details.dart';

class ReikhiHealing extends StatefulWidget {
  const ReikhiHealing({super.key});

  @override
  State<ReikhiHealing> createState() => _ReikhiHealingState();
}

class _ReikhiHealingState extends State<ReikhiHealing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Reikhi & Healing',
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.1,
        ),
        itemCount: 20,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReikhihealingDetails(),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: DesignColor.lightGrey,
                    ),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      'https://i.ytimg.com/vi/dtJm5Mz1Ymk/maxresdefault.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const DesignText(
                                '7 Ratti Cat’s Eye',
                                fontSize: 12,
                                fontWeight: 700,
                              ),
                              Row(
                                children: const [
                                  DesignText(
                                    'Rs.1800',
                                    fontSize: 10,
                                    fontWeight: 600,
                                  ),
                                  SizedBox(width: 6),
                                  DesignText(
                                    'Rs.2200',
                                    fontSize: 10,
                                    fontWeight: 600,
                                    decoration: TextDecoration.lineThrough,
                                    color: DesignColor.lightGrey1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                          width: 54,
                          child: DesignButtons(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ReikhihealingDetails(),
                                ),
                              );
                            },
                            textLabel: 'Buy',
                            isTappedNotifier: ValueNotifier(false),
                            sideWidth: 1,
                            colorText: DesignColor.darkTeal1,
                            borderSide: true,
                            colorBorderSide: DesignColor.darkTeal1,
                            fontSize: 10,
                            fontWeight: 700,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
