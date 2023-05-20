import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/GemStone/gem_stone_details.dart';

class GemStone extends ConsumerStatefulWidget {
  const GemStone({super.key});
  @override
  ConsumerState<GemStone> createState() => _GemStoneState();
}

class _GemStoneState extends ConsumerState<GemStone> {
  @override
  Widget build(BuildContext context) {
    final appStateauto = ref.watch(appStateautoDispose);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Gem Stone list',
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => appStateauto.currentIndex = 0,
        ),
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
                  builder: (context) => const GemStoneDetails(),
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
                      'https://www.ratanrashi.com/product_images/product_292_1260_thumb.jpg',
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
                                  builder: (context) => const GemStoneDetails(),
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
