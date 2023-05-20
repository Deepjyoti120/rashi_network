// import 'package:dsz_education/shared/darkmode_state.dart';
// import 'package:dsz_education/ui/custom/design_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerCard extends StatelessWidget {
//   const ShimmerCard({Key? key, this.radius}) : super(key: key);
//   final double? radius;
//   @override
//   Widget build(BuildContext context) {
//     final DarkMode darkMode = Provider.of<DarkMode>(context);
//     return Shimmer.fromColors(
//       baseColor:
//           darkMode.isDark ? DesignColor.blackBackground : Colors.grey.shade300,
//       highlightColor:
//           darkMode.isDark ? DesignColor.blackCard : Colors.grey.shade100,
//       enabled: true,
//       // child: const Card(
//       //   clipBehavior: Clip.antiAlias,
//       // ),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.circular(radius ?? 6)),
//       ),
//     );
//   }
// }
