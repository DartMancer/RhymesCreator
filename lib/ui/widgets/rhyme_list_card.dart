import 'package:flutter/material.dart';
import 'package:rhymes_creator/ui/ui.dart';

class RhymeListCard extends StatefulWidget {
  const RhymeListCard({
    super.key,
    this.isFavourite = false,
    required this.rhyme,
    this.sourceWord,
    required this.onTap,
  });

  final String rhyme;
  final String? sourceWord;
  final bool isFavourite;
  final VoidCallback onTap;

  @override
  State<RhymeListCard> createState() => _RhymeListCardState();
}

class _RhymeListCardState extends State<RhymeListCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (widget.sourceWord != null) ...[
                Text(
                  widget.sourceWord!,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: theme.hintColor,
                  ),
                ),
              ],
              Text(
                widget.rhyme,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: widget.onTap,
            icon: Icon(
              Icons.favorite,
              color: widget.isFavourite
                  ? theme.primaryColor
                  : theme.hintColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
