// import 'package:dsz_education/login/start.dart';
// import 'package:dsz_education/ui/custom/design_colors.dart';
// import 'package:dsz_education/ui/introScreen/intro_content.dart';
// import 'package:dsz_education/ui/theme/buttons/buttons.dart';
// import 'package:dsz_education/ui/theme/text.dart';
// import 'package:flutter/material.dart';

// class IntroHome extends StatefulWidget {
//   const IntroHome({Key? key}) : super(key: key);

//   @override
//   State<IntroHome> createState() => _IntroHomeState();
// }

// class _IntroHomeState extends State<IntroHome> {
//   int currentPage = 0;
//   final PageController _controller = PageController();
//   List<Map<String, String>> splashData = [
//     {
//       "title": "The Ultimate Homework Management Tool",
//       "image": "assets/lottie/dsz_ideas-bulbs.json",
//       "text":
//           "Say goodbye to the stress and frustration of homework management",
//     },
//     {
//       "title": "Everything You Need in One App",
//       "text":
//           "Create assignments using AI , manage doubts, and collaborate with ease.",
//       "image": "assets/lottie/AGX_spaces_colors.json",
//     },
//     {
//       "title": "Streamline Your Workflow and Boost Productivity",
//       "text":
//           "Reclaim your evenings and focus on teaching and help your students succeed. ",
//       "image": "assets/lottie/chit-chatting.json",
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           children: [
//             // const SizedBox(height: 40),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: List.generate(
//             //     splashData.length,
//             //     (index) => buildDot(index: index),
//             //   ),
//             // ),
//             Expanded(
//               flex: 3,
//               child: PageView.builder(
//                 controller: _controller,
//                 onPageChanged: (value) {
//                   setState(() {
//                     currentPage = value;
//                   });
//                 },
//                 itemCount: splashData.length,
//                 itemBuilder: (context, index) => SplashContent(
//                   image: splashData[index]["image"].toString(),
//                   text: splashData[index]['text'].toString(),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Column(
//                 children: [
//                   const Spacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       splashData.length,
//                       (index) => buildDot(index: index),
//                     ),
//                   ),
//                   const Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       children: [
//                         DesignText(
//                           splashData[currentPage]['title'].toString(),
//                           fontSize: 18,
//                           fontWeight: 700,
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 4),
//                         DesignText.bold2(
//                           splashData[currentPage]['text'].toString(),
//                           textAlign: TextAlign.center,
//                           fontSize: 16,
//                           fontWeight: 500,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(flex: 3),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: DesignButtons.elevated(
//                                   color: DesignColor.dszBlue,
//                                   elevation: 0,
//                                   fontSize: 14,
//                                   fontWeight: 700,
//                                   isTappedNotifier: ValueNotifier<bool>(false),
//                                   onPressed: () async {
//                                     if ((splashData.length - 1) ==
//                                         currentPage) {
//                                       Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (_) =>
//                                                 const SignUpSetup()),
//                                       );
//                                     } else {
//                                       setState(() {
//                                         currentPage++;
//                                         _controller.nextPage(
//                                             duration: const Duration(
//                                                 milliseconds: 500),
//                                             curve: Curves.easeIn);
//                                       });
//                                     }
//                                   },
//                                   textLabel:
//                                       (splashData.length - 1) == currentPage
//                                           ? "Get Started"
//                                           : 'Next'),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (_) =>
//                                                 const SignUpSetup()),
//                                       );
//                                     },
//                                     child: const DesignText(
//                                       "Skip",
//                                       fontSize: 16,
//                                       fontWeight: 600,
//                                       color: DesignColor.dszBlue,
//                                     ))),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   AnimatedContainer buildDot({int? index}) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.only(right: 8),
//       height: 6,
//       width: currentPage == index ? 18 : 8,
//       decoration: BoxDecoration(
//         color: currentPage == index
//             ? const Color(0xFF6F6CD9)
//             : const Color(0xFFCDD9E3),
//         borderRadius: BorderRadius.circular(6),
//       ),
//     );
//   }
// }
