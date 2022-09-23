import 'dart:math';

import 'package:excuses_riverpod/ui/common/mutation_provider.dart';
import 'package:excuses_riverpod/ui/widgets/excuses_page_transition_switcher.dart';
import 'package:excuses_data/excuses_data.dart';
import 'package:excuses_design/excuses_design.dart';
import 'package:excuses_riverpod/ui/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page<dynamic> route() => const MaterialPage(
        child: HomePage(),
      );

  @override
  Widget build(BuildContext context, ref) {
    final excuses$ = ref.watch(excusesProvider);

    ref.listen(mutationProvider('favorite'), (_, state) {
      /// Do something with state
    });

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return ref.refresh(excusesProvider.future).then((excuses) {
              final newExcuse = _randomIndex(excuses.length);
              final id = excuses[newExcuse].id.toString();
              Routemaster.of(context).push('/excuses/$id');
            });
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ExcusesPageTransitionSwitcher(
                    child: excuses$.when(
                      data: (excuses) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.decelerate,
                        opacity: excuses$.isRefreshing ? .5 : 1,
                        child: ExcusesDataView(excuses: excuses),
                      ),
                      error: (_, __) => const ExcuseErrorView(),
                      loading: () => const ExcuseSkeletonView(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: excuses$.hasValue
          ? NextFloatingActionButton(
              excuses: excuses$.value!,
            )
          : null,
    );
  }
}

class ExcusesDataView extends StatelessWidget {
  const ExcusesDataView({super.key, required this.excuses});

  final List<Excuse> excuses;

  @override
  Widget build(BuildContext context) {
    final pathParameters = RouteData.of(context).pathParameters;
    final currentExcuseId = pathParameters.containsKey('id')
        ? int.tryParse(pathParameters['id']!)!
        : excuses[0].id;

    return ExcusePageView(
      excuses: excuses
          .map((e) => ExcuseViewData(
                id: e.id,
                text: e.text,
              ))
          .toList(),
      currentExcuse: currentExcuseId,
    );
  }
}

class ExcuseErrorView extends StatelessWidget {
  const ExcuseErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Something went wrong with your request'),
      ),
    );
  }
}

class ExcuseSkeletonView extends StatelessWidget {
  const ExcuseSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextFloatingActionButton extends StatelessWidget {
  const NextFloatingActionButton({
    Key? key,
    required this.excuses,
  }) : super(key: key);

  final List<Excuse> excuses;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.arrow_forward),
      onPressed: () {
        final currentPage = _randomIndex(excuses.length);
        final id = excuses[currentPage].id.toString();

        Routemaster.of(context).push('/excuses/$id');
      },
    );
  }
}

int _randomIndex(int length) => Random().nextInt(length);
