import 'package:rashi_network/utils/assets_names.dart';

class MoreForYouModel {
  static List<MoreForYouModelItem> items = [
    MoreForYouModelItem(
      title: 'Reiki \n& \nHealing',
      image:AssetsName.imgreikiandhealing,
    ),
    MoreForYouModelItem(
      title: 'Gemstone',
      image: AssetsName.imggemstone,
    ),
    MoreForYouModelItem(
      title: 'Premium Kundali & Ask a Question',
      image: AssetsName.imgpremiumkundali,
    ),
    MoreForYouModelItem(
      title: 'Puja & Jaap',
      image: AssetsName.imgPujs,
    ),
  ];
}

class MoreForYouModelItem {
  final String title;
  final String image;

  MoreForYouModelItem({
    required this.title,
    required this.image,
  });
}
