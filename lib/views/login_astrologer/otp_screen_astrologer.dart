import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/home_controller.dart';
import 'package:rashi_network/views/login_astrologer/document/astrologer_details.dart';

class OTPScreenAstrologer extends StatefulWidget {
  const OTPScreenAstrologer({super.key});

  @override
  State<OTPScreenAstrologer> createState() => _OTPScreenAstrologerState();
}

class _OTPScreenAstrologerState extends State<OTPScreenAstrologer> {
  List<TextEditingController> textEditingController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  StreamController<int> timerStreamController = StreamController<int>();
  Timer? timer;
  final globalState = GlobalKey<FormState>();
  void startTimer() {
    int timeLeft = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        timer.cancel();
      } else {
        timeLeft--;
        timerStreamController.add(timeLeft);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //HomeController
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Verification',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: FloatingActionButton.extended(
              backgroundColor: DesignColor.darkTeal,
              onPressed: () {
                if (globalState.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AstrologerDetailsForm(),
                      ));
                }
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              label: const DesignText(
                "Continue",
                color: Colors.white,
                fontSize: 14,
                fontWeight: 600,
              )),
        ),
      ),
      body: StreamBuilder<int>(
          stream: timerStreamController.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Form(
              key: globalState,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DesignText(
                      'Enter your OTP',
                      fontSize: 20,
                      fontWeight: 600,
                    ),
                    const SizedBox(height: 10),
                    const DesignText(
                      'OTP sent to 7745677**** ',
                      fontSize: 14,
                      fontWeight: 400,
                      color: DesignColor.lightGrey1,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => OtpInput(
                          textEditingController: textEditingController[index],
                          // focusNode: _focusNodes[index],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: snapshot.data == 0
                              ? () {
                                  startTimer();
                                }
                              : null,
                          child: DesignText(
                            'Resend OTP',
                            fontSize: 14,
                            fontWeight: 400,
                            color: snapshot.data == 0
                                ? DesignColor.green
                                : DesignColor.lightGrey1,
                          ),
                        ),
                        DesignText(
                          (snapshot.data ?? 0).toString(),
                          fontSize: 14,
                          fontWeight: 400,
                          color: DesignColor.lightGrey1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // SizedBox(
                    //   height: 48,
                    //   width: double.infinity,
                    //   child: DesignButtons(
                    //     onPressed: () async {
                    //       if (globalState.currentState!.validate()) {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => const HomeController(),
                    //             ));
                    //       }
                    //     },
                    //     textLabel: 'Continue',
                    //     isTappedNotifier: ValueNotifier(false),
                    //     colorText: Colors.white,
                    //     fontSize: 14,
                    //     fontWeight: 600,
                    //     color: DesignColor.darkTeal,
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class OtpInput extends StatefulWidget {
  const OtpInput({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;
  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late bool _isEmpty;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _isEmpty = widget.textEditingController.text.isEmpty;
    _focusNode = FocusNode();
    widget.textEditingController.addListener(_handleTextChanged);
  }

  void _handleTextChanged() {
    setState(() {
      _isEmpty = widget.textEditingController.text.isEmpty;
    });
  }

  void _handleBackspace(RawKeyEvent event) {
    if (_isEmpty && event.logicalKey == LogicalKeyboardKey.backspace) {
      _focusNode.requestFocus();
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_handleTextChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: _handleBackspace,
          child: TextFormField(
            controller: widget.textEditingController,
            onChanged: (value) {
              if (value.length == 1) {
                _focusNode.nextFocus();
                FocusScope.of(context).nextFocus();
              } else {
                _focusNode.nextFocus();
                FocusScope.of(context).previousFocus();
              }
            },
            onTapOutside: (event) {
              final currentFocus = FocusScope.of(context);
              if (currentFocus.focusedChild != null) {
                currentFocus.focusedChild!.unfocus();
              }
            },
            onFieldSubmitted: (_) {
              _focusNode.nextFocus();
              FocusScope.of(context).nextFocus();
            },
            onEditingComplete: () {
              _focusNode.nextFocus();
              FocusScope.of(context).nextFocus();
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "";
              }
              return null;
            },
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              filled: true,
              errorStyle: TextStyle(height: 0, color: Colors.transparent),
              isDense: true,
              fillColor: Colors.transparent,
              // hintStyle: TextStyle(color: DesignColor.darkGrey),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: DesignColor.darkGrey, width: 1.0),
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
                borderSide: BorderSide(color: DesignColor.tapRed, width: 1.0),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ),
    );
  }
}
