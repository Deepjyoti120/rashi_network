import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/login_astrologer/otp_screen_astrologer.dart';

class LoginScreenAstrologer extends StatefulWidget {
  const LoginScreenAstrologer({super.key});

  @override
  State<LoginScreenAstrologer> createState() => _LoginScreenAstrologerState();
}

class _LoginScreenAstrologerState extends State<LoginScreenAstrologer> {
  @override
  Widget build(BuildContext context) {
    //HomeController
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Sign Up',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DesignText(
              'Welcome to Taramandal',
              fontSize: 20,
              fontWeight: 600,
            ),
            const SizedBox(height: 10),
            const DesignText(
              'We are thrilled to  that you are interested to join our community of astrologer.',
              fontSize: 14,
              fontWeight: 400,
              color: DesignColor.lightGrey1,
            ),
            const SizedBox(height: 20),
            TextFormField(
              // controller: controller,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field Required";
                }
                return null;
              },
              onTapOutside: (event) {
                final currentFocus = FocusScope.of(context);
                if (currentFocus.focusedChild != null) {
                  currentFocus.focusedChild!.unfocus();
                }
              },
              decoration: const InputDecoration(
                hintText: 'Enter Your Email or Phone no',
                filled: true,
                isDense: true,
                fillColor: Colors.transparent,
                // hintStyle: TextStyle(color: DesignColor.darkGrey),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding: EdgeInsets.all(16),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: DesignColor.darkGrey, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: DesignColor.lightGrey3, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: DesignColor.lightGrey3, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: DesignColor.tapRed, width: 2.0),
                ),
              ),
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: DesignButtons(
                onPressed: () async {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const OTPScreenAstrologer(),
                      ));
                },
                textLabel: 'Continue',
                isTappedNotifier: ValueNotifier(false),
                colorText: Colors.white,
                fontSize: 14,
                fontWeight: 600,
                color: DesignColor.darkTeal,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: const DesignText(
                'OR',
                fontSize: 16,
                fontWeight: 500,
                color: DesignColor.lightGrey1,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: DesignButtons(
                onPressed: () async {},
                textLabel: 'Continue with Google',
                isTappedNotifier: ValueNotifier(false),
                colorText: Colors.white,
                fontSize: 14,
                fontWeight: 600,
                color: Colors.transparent,
                borderSide: true,
                colorBorderSide: DesignColor.darkTeal,
                child: Row(
                  children: [
                    SizedBox(width: 6),
                    Icon(
                      FontAwesomeIcons.google,
                      color: DesignColor.darkTeal,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    DesignText(
                      'Continue with Google',
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: DesignButtons(
                onPressed: () async {},
                textLabel: 'Continue with Google',
                isTappedNotifier: ValueNotifier(false),
                colorText: Colors.white,
                fontSize: 14,
                fontWeight: 600,
                color: Colors.transparent,
                borderSide: true,
                colorBorderSide: DesignColor.darkTeal,
                child: Row(
                  children: [
                    SizedBox(width: 6),
                    Icon(
                      FontAwesomeIcons.facebook,
                      color: DesignColor.darkTeal,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    DesignText(
                      'Continue with Facebook',
                      fontSize: 12,
                      fontWeight: 500,
                      color: DesignColor.darkTeal,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
