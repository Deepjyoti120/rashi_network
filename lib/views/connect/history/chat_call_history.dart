import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/connect/history/call_history.dart';
import 'package:rashi_network/views/connect/history/chat_history.dart';

class ChatCallHistory extends StatefulWidget {
  const ChatCallHistory({super.key});

  @override
  State<ChatCallHistory> createState() => _ChatCallHistoryState();
}

class _ChatCallHistoryState extends State<ChatCallHistory> {
  bool isChat = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'History',
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
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DesignButtons(
                    onPressed: () async {
                      setState(() => isChat = true);
                    },
                    textLabel: 'Call',
                    isTappedNotifier: ValueNotifier(false),
                    sideWidth: 1,
                    colorText: DesignColor.darkTeal1,
                    borderSide: true,
                    colorBorderSide: Colors.transparent,
                    fontSize: 12,
                    fontWeight: 700,
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: DesignButtons(
                    onPressed: () async {
                      setState(() => isChat = false);
                    },
                    textLabel: 'Chat',
                    isTappedNotifier: ValueNotifier(false),
                    sideWidth: 1,
                    colorText: DesignColor.darkTeal1,
                    borderSide: true,
                    colorBorderSide: Colors.transparent,
                    fontSize: 12,
                    fontWeight: 700,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
              child: Stack(
                children: [
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: DesignColor.lightGrey4,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: isChat
                                ? DesignColor.darkTeal
                                : DesignColor.lightGrey4,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: !isChat
                                ? DesignColor.darkTeal
                                : DesignColor.lightGrey4,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: isChat ? const ChatHistory() : const CallHistory())
          ],
        ),
      ),
    );
  }
}
