import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rashi_network/services/firebase/auth_servoces.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/constants.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/utils/design_utlis.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/connect/history/chat_call_history.dart';
import 'package:rashi_network/views/customer_support/customer_support.dart';
import 'package:rashi_network/views/login_astrologer/login_astrologer.dart';
import 'package:rashi_network/views/membership/membership.dart';
import 'package:rashi_network/views/my_order/my_order.dart';
import 'package:rashi_network/views/wallet/wallet.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateauto = ref.watch(appStateautoDispose);
    final appState = ref.watch(appStateRef);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            accountName: DesignText(
              appState.userReports.user!.name!,
              fontSize: 15,
              fontWeight: 500,
            ),
            accountEmail: DesignText(
              '+91 ${appState.userReports.user!.mobile}',
              fontSize: 15,
              fontWeight: 500,
            ),
            currentAccountPicture: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToK_-LT9HmxfBNTsC0A8wfvjtfxKh3GjexbQ&usqp=CAU'),
            ),
          ),
          // const Divider(color: DesignColor.darkTeal, height: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const DesignText(
                      "Home",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.house,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      appStateauto.currentIndex = 0;
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "My Order",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.bag,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyOrders(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Buy Membership",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.crown,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Membership(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "My wallet",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.wallet,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Wallet(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Chat/Call History",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.userSwitch,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatCallHistory(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Connect with Chat",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.chat,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      appStateauto.currentIndex = 1;
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Connect with Call",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: Icon(
                      PhosphorIcons.regular.phone,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      appStateauto.currentIndex = 2;
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Sign up/Sign In as Astrologer ",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: const Icon(
                      FontAwesomeIcons.userAstronaut,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreenAstrologer(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Customer Support",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: const Icon(
                      FontAwesomeIcons.headset,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerSupport(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Terms and Conditions",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: const Icon(
                      FontAwesomeIcons.fileLines,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      DesignUtlis.launchURL(
                        'https://www.thetaramandal.com/privacy-policy',
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "Privacy Policy",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: const Icon(
                      FontAwesomeIcons.fileLines,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      DesignUtlis.launchURL(
                        'https://www.thetaramandal.com/privacy-policy',
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                  ListTile(
                    title: const DesignText(
                      "logout",
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                    leading: const Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      size: 20,
                      color: DesignColor.darkTeal,
                    ),
                    onTap: () {
                      AuthService().signOut();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreenAstrologer(),
                      //   ),
                      // );
                    },
                  ),
                  const Divider(color: DesignColor.darkTeal, height: 1),
                ],
              ),
            ),
          ),
          Container(
            height: 92,
            alignment: Alignment.center,
            color: DesignColor.darkTeal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 6),
                const DesignText(
                  "Also Available on",
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: 600,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        DesignUtlis.launchURL(Constants.urlFacebook);
                      },
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        DesignUtlis.launchURL(Constants.urlInstagram);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        DesignUtlis.launchURL(Constants.urlYoutube);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
