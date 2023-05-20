import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool openDocumentButtm = false;
  final controller = ScrollController();
  final text = TextEditingController();
  List<Map<String, dynamic>> chatConversations = [
    {
      'messages': 'Hi Alice, how are you? admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hey Bob, what\'s up?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Welcome to our chat app! admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hi Alice, how are you?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Hi Alice, how are you? admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hey Bob, what\'s up?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Welcome to our chat app! admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hi Alice, how are you?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Hi Alice, how are you? admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hey Bob, what\'s up?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Welcome to our chat app! admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hi Alice, how are you?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Hi Alice, how are you? admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hey Bob, what\'s up?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Welcome to our chat app! admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hi Alice, how are you?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Hi Alice, how are you? admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hey Bob, what\'s up?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Welcome to our chat app! admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hi Alice, how are you?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Hi Alice, how are you? admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hey Bob, what\'s up?',
      'isAdminOnly': false,
    },
    {
      'messages': 'Welcome to our chat app! admin',
      'isAdminOnly': true,
    },
    {
      'messages': 'Hi Alice, how are you?',
      'isAdminOnly': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    // final userStream = Provider.of<UserStream>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Astro Kunal Khemu',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 700,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: text,
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
              onChanged: (value) {
                if (text.text.trim().length == 1 || text.text.trim().isEmpty) {
                  setState(() {});
                }
                if (openDocumentButtm) {
                  openDocumentButtm = false;
                  setState(() {});
                }
              },
              decoration: InputDecoration(
                hintText: 'Type Message',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: text.text.trim().isEmpty ? 30 : 65,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(60),
                          clipBehavior: Clip.antiAlias,
                          child: IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                openDocumentButtm = !openDocumentButtm;
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.link,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                        if (text.text.trim().isNotEmpty)
                          const SizedBox(width: 8),
                        if (text.text.trim().isNotEmpty)
                          Material(
                            borderRadius: BorderRadius.circular(60),
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding: const EdgeInsets.all(16),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: DesignColor.darkGrey, width: 1.0),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: DesignColor.lightGrey3, width: 1.0),
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: DesignColor.lightGrey3, width: 1.0),
                  borderRadius: BorderRadius.circular(6),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: DesignColor.tapRed, width: 1.0),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              minLines: 1,
            ),
          ),
          if (!openDocumentButtm) const SizedBox(height: 12),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: openDocumentButtm ? 100 : 0,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      color: DesignColor.lightGrey,
                      height: 2,
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.link,
                          size: 16,
                        ),
                      ),
                      CustomIconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.image,
                          size: 16,
                        ),
                      ),
                      CustomIconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.camera,
                          size: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: ListView.builder(
            itemCount: chatConversations.length,
            shrinkWrap: true,
            reverse: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final chatMessage = chatConversations[index];
              return ChatCard(
                chatConversations: chatMessage,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          width: 1,
          color: DesignColor.lightGrey,
        ),
      ),
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(60),
        clipBehavior: Clip.antiAlias,
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chatConversations,
  });
  final Map chatConversations;
  @override
  Widget build(BuildContext context) {
    //final userStream = Provider.of<UserStream>(context);
    // final currentUid = FirebaseAuth.instance.currentUser?.uid;
    return Container(
      padding: EdgeInsets.only(
        left: chatConversations['isAdminOnly'] ? 60 : 8,
        right: chatConversations['isAdminOnly'] ? 14 : 60,
        top: 10,
        bottom: 10,
      ),
      child: Align(
        alignment: chatConversations['isAdminOnly']
            ? Alignment.topRight
            : Alignment.topLeft,
        child: IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // if (chatMessage.uid != currentUid)
              //   Container(
              //     clipBehavior: Clip.antiAlias,
              //     decoration:
              //     BoxDecoration(borderRadius: BorderRadius.circular(60)),
              //     child: Image.network(
              //       chatMessage.profilePhoto!,
              //       height: 30,
              //       width: 30,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // if (chatMessage.uid != currentUid) const SizedBox(width: 4),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: chatConversations['isAdminOnly']
                        ? const Radius.circular(12)
                        : const Radius.circular(2),
                    bottomRight: chatConversations['isAdminOnly']
                        ? const Radius.circular(2)
                        : const Radius.circular(12),
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                  ),
                  color: chatConversations['isAdminOnly']
                      ? DesignColor.teal
                      : DesignColor.aqua,
                ),
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
                width: MediaQuery.of(context).size.width * 0.7,
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Flexible(
                      //   child: DesignText(
                      //     chatConversations['isAdminOnly'].toString(),
                      //     fontSize: 14,
                      //   ),
                      // ),
                      // const SizedBox(height: 6),
                      // if (chatMessage.type ==
                      //     EnumWhatsAppMessageType.image.name)
                      //   GestureDetector(
                      //     onTap: () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   CupertinoPageRoute(
                      //       //     builder: (context) =>
                      //       //         PhotoView(imageUrl: chatMessage.link!),
                      //       //   ),
                      //       // );
                      //     },
                      //     child: Container(
                      //       clipBehavior: Clip.antiAlias,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(6)),
                      //       child: Image.network(
                      //         chatMessage.link!,
                      //         width: MediaQuery.of(context).size.width / 2.3,
                      //       ),
                      //     ),
                      //   ),
                      const SizedBox(height: 6),
                      // if (chatMessage.type ==
                      //     EnumWhatsAppMessageType.message.name)
                      Flexible(
                        child: DesignText(
                          chatConversations['messages'],
                          fontSize: 12,
                          fontWeight: 400,
                        ),
                      ),

                      const SizedBox(height: 6),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: const DesignText(
                          '7:00 PM', //timeago.format(chatMessage.date!.toDate()),
                          fontSize: 10, fontWeight: 400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatOption extends StatelessWidget {
  const ChatOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_balance),
          highlightColor: Colors.red,
          hoverColor: Colors.red,
          focusColor: Colors.red,
        ),
        const DesignText(
          "Redeem",
        ),
      ],
    );
  }
}
