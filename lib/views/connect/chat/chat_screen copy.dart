
// import 'package:flutter/material.dart';  
// import 'package:flutter/cupertino.dart'; 
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rashi_network/ui/theme/text.dart'; 

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   bool ttt = false;
//   final controller = ScrollController();
//   final text = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // final userStream = Provider.of<UserStream>(context);
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//         ttt = false;
//         setState(() {});
//       },
//       child: Scaffold(
       
//         body: StreamBuilder<List<ChatModel>>(
//             stream: FirestoreServices().streamGroupChat(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var snap = snapshot.data!;
//                 return Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     SingleChildScrollView(
//                       reverse: true,
//                       controller: controller,
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 70),
//                         child: ListView.builder(
//                           itemCount: snap.length,
//                           shrinkWrap: true,
//                           reverse: true,
//                           padding: const EdgeInsets.only(top: 10, bottom: 10),
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             final chatMessage = snap[index];
//                             return ChatCard(chatMessage: chatMessage);
//                           },
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.bottomCenter,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           if (ttt)
//                             Padding(
//                               padding: const EdgeInsets.only(right: 14 * 4),
//                               child: Container(
//                                 height: 100,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                   color: Constants.rippleBackgroundCard,
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                               ),
//                             ),
//                           if (ttt) const SizedBox(height: 6),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
//                             child: DesignContainer(
//                                 color: Constants.rippleBackgroundCard,
//                                 width: double.infinity,
//                                 borderRadius: 60,
//                                 child: Padding(
//                                   padding:
//                                   const EdgeInsets.fromLTRB(8, 8, 8, 8),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: TextFormField(
//                                           controller: text,
//                                           validator: (val) {
//                                             if (val == null || val.isEmpty) {
//                                               return "Field Can't be empty";
//                                             }
//                                             return null;
//                                           },
//                                           onChanged: (value) {
//                                             if (text.text.trim().length == 1 ||
//                                                 text.text.trim().isEmpty) {
//                                               setState(() {});
//                                             }
//                                           },
//                                           decoration: const InputDecoration(
//                                             hintText: "Type Something...",
//                                             filled: true,
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   width: 0,
//                                                   color: Colors.transparent),
//                                             ),
//                                             fillColor: Colors.transparent,
//                                             border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   width: 0,
//                                                   color: Colors.transparent),
//                                             ),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   width: 0,
//                                                   color: Colors.transparent),
//                                             ),
//                                             contentPadding: EdgeInsets.fromLTRB(
//                                                 12, 3, 6, 3),
//                                           ),
//                                           maxLines: 6,
//                                           minLines: 1,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding:
//                                         EdgeInsets.symmetric(horizontal: 4),
//                                         child: Icon(
//                                           FontAwesomeIcons.image,
//                                           color: Constants.rippleBlueGrey,
//                                         ),
//                                       ),
//                                       // if (text.text.trim().isNotEmpty)
//                                       AnimatedContainer(
//                                         duration:
//                                         const Duration(milliseconds: 400),
//                                         curve: Curves.linear,
//                                         width:
//                                         text.text.trim().isEmpty ? 0 : 40,
//                                         height: 40,
//                                         child: Material(
//                                           color: text.text.trim().isEmpty
//                                               ? Constants.rippleblue
//                                               .withOpacity(0.2)
//                                               : Constants.rippleblue,
//                                           borderRadius:
//                                           BorderRadius.circular(60),
//                                           clipBehavior: Clip.antiAlias,
//                                           child: IconButton(
//                                             onPressed: () async {
//                                               if (text.text.trim().isEmpty) {
//                                                 return;
//                                               }
//                                               DateTime ntp = await NTP.now();
//                                               FirestoreServices()
//                                                   .sendGroupMessage(
//                                                 userStream: userStream,
//                                                 chatModel: ChatModel(
//                                                   message: text.text.trim(),
//                                                   date: Timestamp.fromDate(ntp),
//                                                   link: "",
//                                                   pinned: false,
//                                                   profilePhoto:
//                                                   userStream.profilePhoto,
//                                                   rewarded: false,
//                                                   type: "text",
//                                                   uid: userStream.uid,
//                                                   userName: userStream.name,
//                                                 ),
//                                               )
//                                                   .then((value) {
//                                                 text.clear();
//                                                 FocusManager
//                                                     .instance.primaryFocus
//                                                     ?.unfocus();
//                                               });
//                                             },
//                                             constraints: const BoxConstraints(),
//                                             icon: Hero(
//                                               tag: "chatSend",
//                                               child: Icon(
//                                                 Icons.send,
//                                                 size: 19,
//                                                 color: text.text.trim().isEmpty
//                                                     ? Constants.rippleblue
//                                                     .withOpacity(0.2)
//                                                     : Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 );
//               } else {
//                 return const MiniCircuarProgress();
//               }
//             }),
//       ),
//     );
//   }
// }
// //wkhdhdgfhgdfddj
// class ChatCard extends StatelessWidget {
//   const ChatCard({
//   super.key,
//   required this.chatMessage,
//   });

//   final ChatModel chatMessage;

//   @override
//   Widget build(BuildContext context) {
//     //final userStream = Provider.of<UserStream>(context);
//     final currentUid = FirebaseAuth.instance.currentUser?.uid;
//     return Container(
//       padding: EdgeInsets.only(
//         left: chatMessage.uid == currentUid ? 60 : 8,
//         right: chatMessage.uid != currentUid
//             ? chatMessage.uid == "admin"
//             ? 14
//             : 60
//             : 14,
//         top: 10,
//         bottom: 10,
//       ),
//       child: Align(
//         alignment: chatMessage.uid != currentUid
//             ? chatMessage.uid == "admin"
//             ? Alignment.topRight
//             : Alignment.topLeft
//             : Alignment.topRight,
//         child: IntrinsicWidth(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               if (chatMessage.uid != currentUid)
//                 Container(
//                   clipBehavior: Clip.antiAlias,
//                   decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(60)),
//                   child: Image.network(
//                     chatMessage.profilePhoto!,
//                     height: 30,
//                     width: 30,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               if (chatMessage.uid != currentUid) const SizedBox(width: 4),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: chatMessage.uid != currentUid
//                         ? chatMessage.uid == "admin"
//                         ? const Radius.circular(20)
//                         : const Radius.circular(4)
//                         : const Radius.circular(20),
//                     bottomRight: chatMessage.uid == currentUid
//                         ? const Radius.circular(4)
//                         : chatMessage.uid == "admin"
//                         ? const Radius.circular(4)
//                         : const Radius.circular(20),
//                     topLeft: const Radius.circular(20),
//                     topRight: const Radius.circular(20),
//                   ),
//                   color: chatMessage.uid != currentUid
//                       ? chatMessage.uid == "admin"
//                       ? Constants.rippleBackgroundCard
//                       : Constants.rippleIndigo
//                       : Constants.rippleBlueGrey,
//                 ),
//                 padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
//                 width: MediaQuery.of(context).size.width*0.7,
//                 child: IntrinsicWidth(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Flexible(
//                         child: DesignText(
//                           text: chatMessage.userName ?? "",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Constants.rippleOrange,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       if (chatMessage.type ==
//                           EnumWhatsAppMessageType.image.name)
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               CupertinoPageRoute(
//                                 builder: (context) =>
//                                     PhotoView(imageUrl: chatMessage.link!),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6)),
//                             child: Image.network(
//                               chatMessage.link!,
//                               width: MediaQuery.of(context).size.width / 2.3,
//                             ),
//                           ),
//                         ),
//                       const SizedBox(height: 6),
//                       // if (chatMessage.type ==
//                       //     EnumWhatsAppMessageType.message.name)
//                       Flexible(
//                         child: DesignText(
//                           text: chatMessage.message ?? "",
//                           fontSize: 13,
//                           height: 1.5,
//                           fontFamily: 'PressStart2P',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),

//                       const SizedBox(height: 6),
//                       Container(
//                         alignment: Alignment.bottomRight,
//                         child: DesignText(
//                           text: timeago.format(chatMessage.date!.toDate()),
//                           fontSize: 8,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatOption extends StatelessWidget {
//   const ChatOption({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.account_balance),
//           highlightColor: Colors.red,
//           hoverColor: Colors.red,
//           focusColor: Colors.red,
//         ),
//         DesignText.font(
//           "Redeem",
//           fontFamily: GoogleFonts.poppins().fontFamily,
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//         ),
//       ],
//     );
//   }
// }