import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/ui/widgets/coming_soon.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/home_static/more_for_you.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/kundali/premium_kundali/premium_kundali.dart';
import 'package:rashi_network/views/reikhi_healing/reikhi_healing.dart';

class MoreForYouCardGrid extends StatelessWidget {
  const MoreForYouCardGrid({
    super.key,
    required this.appStateauto,
  });
  final AppState appStateauto;
  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => const ComingSoon()),
            MaterialPageRoute(builder: (context) => const ReikhiHealing()),
          );
          break;
        case 1:
          appStateauto.currentIndex = 3;
          break;
        case 2:
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => const ComingSoon()),
            MaterialPageRoute(builder: (context) => const PremiumKundali()),
          );
          break;
        case 3:
          // Navigator.push(
          //   context,
          //   // MaterialPageRoute(builder: (context) => const ComingSoon()),
          //   MaterialPageRoute(builder: (context) => const PremiumKundali()),
          // );
          break;
        default:
          break;
      }
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.48,
      ),
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = MoreForYouModel.items[index];
        return GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            children: [
              DesignContainer(
                height: 80,
                clipBehavior: Clip.antiAlias,
                bordered: true,
                allPadding: 0,
                borderAllColor: DesignColor.lightGrey,
                child: Image.asset(data.image, fit: BoxFit.fill),
              ),
              const SizedBox(height: 2),
              DesignText(
                data.title,
                fontSize: 14,
                fontWeight: 500,
                textAlign: TextAlign.center,
                maxLines: 4,
              )
            ],
          ),
        );
      },
    );
  }
}
