import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/bloc/cubit/theme_cubit.dart';
import 'package:rhymes_creator/features/history/bloc/history_rhymes_bloc.dart';
import 'package:rhymes_creator/ui/ui.dart';

import '../widget/widget.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(title: 'Настройки'),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Темная тема',
              value: isDark,
              onChanged: (value) => _setThemeBrightness(context, value),
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Уведомления',
              value: false,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Разрешить аналитику',
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Очистить историю',
              iconData: CupertinoIcons.delete_simple,
              iconColor: Colors.redAccent,
              onTap: () => _clearConfirmHistory(context),
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Поддержка',
              iconData: Icons.message_outlined,
              onTap: () {
                if (theme.isAndroid) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SupportBottomSheet(),
                  );
                  return;
                }
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => const SupportBottomSheet(),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context.read<ThemeCubit>().setThemeBrightness(
          value ? Brightness.dark : Brightness.light,
        );
  }

  void _clearConfirmHistory(BuildContext context) {
    final theme = Theme.of(context);

    if (theme.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
          onConfirm: () => _clearHistory(context),
        ),
      );
      return;
    }
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ConfirmationDialog(
        onConfirm: () => _clearHistory(context),
      ),
    );
  }

  void _clearHistory(BuildContext context) {
    BlocProvider.of<HistoryRhymesBloc>(context).add(ClearRhymesHistory());
  }
}

class SupportBottomSheet extends StatelessWidget {
  const SupportBottomSheet({
    super.key,
    // required this.theme,
  });

  // final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (theme.isAndroid) {
      return Padding(
        padding: const EdgeInsets.all(24.0).copyWith(top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () => _close(context),
                  icon: Icon(
                    Icons.close,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                label: const Text('Написать в телеграм'),
                icon: Icon(
                  Icons.telegram,
                  color: theme.iconTheme.color,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.iconTheme.color,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.mail),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  side: BorderSide(color: theme.colorScheme.primary),
                ),
                label: const Text('Отправить Email'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    }
    return CupertinoActionSheet(
      title: const Text('Поддержка'),
      message: const Text('Ответим Вам быстро!'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: Text(
            'Написать в телеграм',
            style: TextStyle(
              color: theme.cupertionoActionColor,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Отправить Email',
            style: TextStyle(
              color: theme.cupertionoActionColor,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (theme.isAndroid) {
      return AlertDialog(
        content: const _DialogContent(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        backgroundColor: theme.cardColor,
        surfaceTintColor: theme.cardColor,
        actions: [
          TextButton(
            onPressed: () => _confirm(context),
            child: Text(
              'Да',
              style: TextStyle(color: theme.hintColor),
            ),
          ),
          TextButton(
            onPressed: () => _close(context),
            child: Text(
              'Нет',
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
        ],
      );
    }
    return CupertinoAlertDialog(
      content: const _DialogContent(
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => _confirm(context),
          isDestructiveAction: true,
          child: const Text('Да'),
        ),
        CupertinoDialogAction(
          onPressed: () => _close(context),
          isDefaultAction: true,
          child: Text(
            'Нет',
            style: TextStyle(color: theme.cupertionoActionColor),
          ),
        ),
      ],
    );
  }

  void _close(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _confirm(BuildContext context) {
    onConfirm();
    Navigator.of(context).pop();
  }
}

class _DialogContent extends StatelessWidget {
  const _DialogContent({
    required this.crossAxisAlignment,
  });

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Вы уверены?',
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 15),
        Text(
          'При согласии история будет удалена навсегда',
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
