import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.pinned = false,
    this.bottom,
  });

  final String title;
  final bool pinned;
  final PreferredSize? bottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: theme.appBarTheme.backgroundColor,
      pinned: pinned,
      snap: true,
      floating: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      bottom: bottom,
    );
  }
}
