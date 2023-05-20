import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rashi_network/ui/theme/container.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/home_static/home_first_row_model.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/blogs/view_all_blogs.dart';
import 'package:rashi_network/views/kundali/free_kundali/free_kundali.dart';

class HomeFirstView extends StatelessWidget {
  const HomeFirstView({
    super.key,
    required this.appStateauto,
  });

  final AppState appStateauto;

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      switch (index) {
        case 0:
          appStateauto.currentIndex = 1;
          break;
        case 1:
          appStateauto.currentIndex = 2;
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FreeKundali()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LatestBlogsAllView()),
          );
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
        childAspectRatio: 0.75,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = HomeFirstModel.items[index];
        return GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            children: [
              DesignContainer(
                height: 60, width: 60,
                bordered: true,
                blurRadius: 6, borderRadius: BorderRadius.circular(12),
                blurRadiuscolor: DesignColor.darkTeal.withOpacity(0.4),
                // borderAllColor: DesignColor.lightGrey,
                color: DesignColor.darkTeal,
                isColor: true,
                child: data.svg != null
                    ? SvgPicture.asset(
                        data.svg!,
                        color: Colors.white,
                      )
                    : Icon(
                        data.iconData,
                        color: Colors.white,
                      ),
              ),
              const SizedBox(height: 2),
              DesignText(
                data.title,
                fontSize: 10,
                fontWeight: 400,
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
  }
}
