import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/viewmodel/model/horoscope_model.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/GemStone/gem_stone_details.dart';
import 'package:rashi_network/views/daily_horoscope/daily_horoscope_details.dart';

class DailyHoroscope extends ConsumerStatefulWidget {
  const DailyHoroscope({super.key});

  @override
  ConsumerState<DailyHoroscope> createState() => _DailyHoroscopeState();
}

class _DailyHoroscopeState extends ConsumerState<DailyHoroscope> {
  @override
  Widget build(BuildContext context) {
    final appStateauto = ref.watch(appStateautoDispose);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Daily Horoscope',
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.1,
        ),
        itemCount: HoroscopeModel.items.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final livedata = HoroscopeModel.items[index];
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const DailyHoroscopeDetails(),
              //   ),
              // );
            },
            child: Container(
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
              child: Column(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset(
                          livedata.image,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  DesignText(
                    livedata.title,
                    fontSize: 14,
                    fontWeight: 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DesignText(
                      livedata.date,
                      fontSize: 10,
                      fontWeight: 500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
