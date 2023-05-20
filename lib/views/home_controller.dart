import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rashi_network/services/api/api_access.dart';
import 'package:rashi_network/ui/custom/bottom_bar.dart';
import 'package:rashi_network/utils/assets_names.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/darkmode_state.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/GemStone/gem_stone.dart';
import 'package:rashi_network/views/app_drawer.dart';
import 'package:rashi_network/views/connect/call/call.dart';
import 'package:rashi_network/views/connect/chat/chat.dart';
import 'package:rashi_network/views/home/home_screen.dart';
import 'package:rashi_network/views/wallet/wallet.dart';

class HomeController extends ConsumerStatefulWidget {
  const HomeController({super.key});
  @override
  ConsumerState<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends ConsumerState<HomeController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ApiAccess().getProfile(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = ref.watch(darkModeRef);
    final appStateauto = ref.watch(appStateautoDispose);
    return WillPopScope(
      onWillPop: () async {
        if (appStateauto.currentIndex != 0) {
          appStateauto.currentIndex = 0;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: appStateauto.currentIndex == 0
            ? AppBar(
                elevation: 0,
                title: SvgPicture.asset(
                  AssetsName.svgLogo,
                  alignment: Alignment.centerLeft,
                  height: 30,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Wallet(),
                          ),
                        );
                      },
                      icon: Icon(PhosphorIcons.regular.wallet)),
                  const SizedBox(width: 14),
                ],
              )
            : null,
        drawer: const AppDrawer(),
        body: getBody(darkMode, appStateauto),
        bottomNavigationBar: _buildBottomBar(darkMode, appStateauto),
      ),
    );
  }
///  done
  Widget _buildBottomBar(DarkMode darkMode, AppState appStateauto) {
    return CustomBottomBar(
      backgroundColor: darkMode.isDark ? DesignColor.blackCard : null,
      bottomColor: darkMode.isDark ? DesignColor.blackCard : null,
      containerHeight: 60,
      iconSize: 18,
      itemCornerRadius: 8,
      selectedIndex: appStateauto.currentIndex,
      showElevation: true,
      curve: Curves.linear,
      animationDuration: const Duration(milliseconds: 400),
      onItemSelected: (index) => appStateauto.currentIndex = index,
      items: <BottomBarItem>[
        BottomBarItem(
          icon: Icon(
            PhosphorIcons.regular.house,
            size: 22,
          ),
          title: const Text('Home'),
          activeColor: DesignColor.darkTeal,
          inactiveColor: DesignColor.darkGrey,
        ),
        BottomBarItem(
          icon: Icon(
            PhosphorIcons.regular.chat,
            size: 22,
          ),
          title: const Text('Chat'),
          activeColor: DesignColor.darkTeal,
          inactiveColor: DesignColor.darkGrey,
        ),
        BottomBarItem(
          activeColor: DesignColor.darkTeal,
          icon: Icon(
            PhosphorIcons.regular.phone,
            size: 22,
          ),
          title: const Text('Call'),
          inactiveColor: DesignColor.darkGrey,
        ),
        BottomBarItem(
          icon: Icon(
            PhosphorIcons.regular.shoppingCart,
            size: 22,
          ),
          title: const Text('Shop'),
          activeColor: DesignColor.darkTeal,
          inactiveColor: DesignColor.darkGrey,
        ),
      ],
    );
  }

  Widget getBody(DarkMode darkMode, AppState appStateauto) {
    List<Widget> pages = const [
      HomeScreen(),
      Chat(),
      Call(),
      // ComingSoon()
      GemStone(),
    ];
    return IndexedStack(index: appStateauto.currentIndex, children: pages);
  }
}
