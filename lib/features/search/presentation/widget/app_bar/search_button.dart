// import 'package:flutter/material.dart';

// class SearchButton extends StatelessWidget {
//   const SearchButton({
//     super.key,
//     required this.controller,
//     required this.onTap,
//   });

//   final TextEditingController controller;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: Container(
//           width: double.infinity,
//           margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(
//             bottom: 16,
//           ),
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: theme.colorScheme.secondaryContainer,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               Icon(Icons.search_rounded, color: theme.primaryColor),
//               const SizedBox(width: 12),
//               AnimatedBuilder(
//                 animation: controller,
//                 builder: (context, _) {
//                   return Text(
//                     controller.text.isEmpty ? 'Поиск рифм...' : controller.text,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: theme.primaryColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
