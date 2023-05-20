import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rashi_network/utils/assets_names.dart';

class HomeFirstModel {
  static List<HomeFirstModelItem> items = [
    HomeFirstModelItem(
      title: 'Chat',
      iconData: PhosphorIcons.regular.chat,
    ),
    HomeFirstModelItem(
      title: 'Call',
      iconData: PhosphorIcons.regular.phone,
    ),
    HomeFirstModelItem(
      title: 'Free Kundli',
      iconData: FontAwesomeIcons.phone,
      svg: AssetsName.svgPremiumkundli,
    ),
    HomeFirstModelItem(
      title: 'Myth Busting blogs',
      iconData: PhosphorIcons.regular.clipboard,
    ),
  ];
}

class HomeFirstModelItem {
  final String title;
  final IconData iconData;
  final String? svg;

  HomeFirstModelItem({
    required this.title,
    required this.iconData,
    this.svg,
  });
}
