import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:excuses_provider/ui/widgets/excuses_page_transition_switcher.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'package:excuses_data/excuses_data.dart';
import 'package:excuses_design/excuses_design.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  static Page<dynamic> route() => const MaterialPage(
        child: HomePage(),
      );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<Resource<List<Excuse>>>(
      create: (context) => context
          .read<ExcuseFacade>()
          .fetchExcuses()
          .then((value) => Resource.success(data: value))
          .catchError((err) => Resource<List<Excuse>>.error(msg: '$err')),
      initialData: const Resource.loading(),
      builder: ((context, child) {
        final Resource<List<Excuse>> state = context.watch();
        final excuses = state.data;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ExcusesPageTransitionSwitcher(
                child: Builder(
                  key: ValueKey(state),
                  builder: (context) {
                    if (state is LoadingResource) {
                      return const ExcuseSkeletonView();
                    }

                    if (state is ErrorResource) {
                      return const ExcuseErrorView();
                    }

                    return ExcusesDataView(
                      excuses: excuses!,
                    );
                  },
                ),
              ),
            ),
          ),
          floatingActionButton: (excuses?.isNotEmpty ?? false)
              ? NextFloatingActionButton(
                  excuses: excuses!,
                )
              : null,
        );
      }),
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

int _randomIndex(int length) => Random().nextInt(length);

class Resource<T> extends Equatable {
  const Resource({this.data, this.msg = ''});

  final T? data;
  final String msg;

  const factory Resource.loading() = LoadingResource;

  const factory Resource.success({required T data}) = SuccessResource;

  const factory Resource.error({required String msg, T? data}) = ErrorResource;

  @override
  List<Object?> get props => [data, msg];
}

class LoadingResource<T> extends Resource<T> {
  const LoadingResource();
}

class SuccessResource<T> extends Resource<T> {
  const SuccessResource({super.data});
}

class ErrorResource<T> extends Resource<T> {
  const ErrorResource({super.data, super.msg});
}
