import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/features/history/bloc/history_rhymes_bloc.dart';
import 'package:rhymes_creator/ui/ui.dart';

import '../widget/widget.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<HistoryRhymesBloc>(context).add(LoadHistoryRhymes());

    //TODO Раскомментировать для пушей

    // _initNotifications();
    super.initState();
  }

  //TODO Раскомментировать для пушей

  // Future<void> _initNotifications() async {
  //   final repository = context.read<NotificationsRepositoryI>();
  //   final result = await repository.requestPermission();
  //   if (result) {
  //     repository.getToken().then((token) => log(token ?? '....'));
  //     repository.init();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        AppBarWidget(
          title: 'Rhymes Creator',
          pinned: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchRhymeBottomSheet(
              controller: _searchController,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const RhymesHistoryCards(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const RhymesListCard(),
        const SliverToBoxAdapter(child: SizedBox(height: 60)),
      ],
    );
  }
}

  // Future<void> _showSearchBottomSheet(BuildContext context) async {
  //   final bloc = BlocProvider.of<RhymesListBloc>(context);

  //   final query = await showModalBottomSheet<String>(
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     elevation: 0,
  //     builder: (context) => Padding(
  //       padding: const EdgeInsets.only(top: 120),
  //       child: SearchRhymeBottomSheet(controller: _searchController),
  //     ),
  //   );

  //   if (query?.isNotEmpty ?? false) {
  //     bloc.add(SearchRhymes(query: query!));
  //   }
  // }

        // SearchButton(
            //   controller: _searchController,
            //   onTap: () => _showSearchBottomSheet(context),
            // ),
