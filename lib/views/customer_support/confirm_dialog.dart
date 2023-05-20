import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/home_controller.dart';

class DocumentsSuccessDialog extends StatefulWidget {
  const DocumentsSuccessDialog({
    Key? key,
    required this.svgImg,
    required this.title2,
    required this.deleteText,
    this.svgHeight,
  }) : super(key: key);
  final String svgImg;
  final String title2;
  final String deleteText;
  final double? svgHeight;
  @override
  State<StatefulWidget> createState() => DocumentsSuccessDialogState();
}

class DocumentsSuccessDialogState extends State<DocumentsSuccessDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scaleAnimation!,
        child: AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Column(
              children: [
                SvgPicture.asset(
                  widget.svgImg,
                  height: widget.svgHeight ?? 200,
                ),
                const SizedBox(height: 40),
                const DesignText(
                  "We are happy to help you",
                  fontSize: 20,
                  fontWeight: 600,
                  color: DesignColor.darkTeal,
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 6),
                // DesignText.bold2(
                //   widget.title,
                //   color: DesignColor.darkTeal,
                //   fontSize: 16,
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 6),
                DesignText.bold2(
                  widget.title2,
                  color: DesignColor.darkTeal,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DesignButtons(
                            isTappedNotifier: ValueNotifier<bool>(false),
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeController(),
                                ),
                                (route) => false,
                              );
                            },
                            textLabel: widget.deleteText,
                            fontSize: 14,
                            fontWeight: 700,
                            elevation: 0,
                            pdbottom: 16,
                            color: DesignColor.darkTeal,
                            colorText: Colors.white,
                            pdtop: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: DesignButtons(
                    //         isTappedNotifier: ValueNotifier<bool>(false),
                    //         onPressed: () async {
                    //           Navigator.pop(context, false);
                    //         },
                    //         textLabel: "Back",
                    //         fontSize: 14,
                    //         fontWeight: 700,
                    //         elevation: 0,
                    //         pdbottom: 16,
                    //         color: Colors.transparent,
                    //         pdtop: 16,
                    //         borderSide: true,
                    //         colorBorderSide: DesignColor.darkTeal,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
