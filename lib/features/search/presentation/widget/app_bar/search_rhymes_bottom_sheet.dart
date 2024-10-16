import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/features/search/bloc/rhymes_list_bloc.dart';

class SearchRhymeBottomSheet extends StatelessWidget {
  const SearchRhymeBottomSheet({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: controller,
                inputFormatters: const [
                  // FilteringTextInputFormatter.allow(RegExp('a-zA-Z')),
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Начни вводить слово...',
                  hintStyle: TextStyle(
                    color: theme.hintColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => _onTapSearch(context),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.search,
                color: theme.iconTheme.color,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onTapSearch(BuildContext context) {
    final bloc = BlocProvider.of<RhymesListBloc>(context);
    final query = controller.text;
    if (query.isNotEmpty) {
      bloc.add(SearchRhymes(query: query));
    }
    controller.clear();
  }
}


    // BaseBottomSheet(
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   color: theme.colorScheme.secondaryContainer,
    //                   borderRadius: BorderRadius.circular(8),
    //                 ),
    //                 child: TextField(
    //                   controller: controller,
    //                   inputFormatters: const [
    //                     // FilteringTextInputFormatter.allow(RegExp('a-zA-Z')),
    //                   ],
    //                   decoration: InputDecoration(
    //                     contentPadding: const EdgeInsets.symmetric(
    //                       horizontal: 12,
    //                     ),
    //                     enabledBorder: const OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                     ),
    //                     border: const OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                     ),
    //                     hintText: 'Начни вводить слово...',
    //                     hintStyle: TextStyle(
    //                       color: theme.hintColor.withOpacity(0.5),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(width: 12),
    //             GestureDetector(
    //               onTap: () => _onTapSearch(context),
    //               child: Container(
    //                 width: 48,
    //                 height: 48,
    //                 decoration: BoxDecoration(
    //                   color: theme.primaryColor,
    //                   borderRadius: BorderRadius.circular(8),
    //                 ),
    //                 child: Icon(
    //                   Icons.search,
    //                   color: theme.iconTheme.color,
    //                   size: 30,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       const Divider(height: 1),
    //       Expanded(
    //         child: ListView.separated(
    //           itemBuilder: (context, index) => ListTile(
    //             title: const Text('Слово из автокомплита'),
    //             onTap: () {},
    //           ),
    //           separatorBuilder: (context, _) => const Divider(height: 1),
    //           itemCount: 15,
    //         ),
    //       )
    //     ],
    //   ),
    // );