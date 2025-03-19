import 'package:career/core/global_views/all_areas/cubit/all_area_cubit.dart';
import 'package:career/core/global_views/all_areas/cubit/all_area_state.dart';
import 'package:career/core/global_views/all_areas/repo/all_area_repo.dart';
import 'package:career/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAreasSearchView extends SearchDelegate {
  AllAreasSearchView(this.governorateId);
  final int governorateId;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (context) => AllAreasCubit(
        AllAreasRepo(),
        governorateId,
      )..onInit(),
      child: BlocBuilder<AllAreasCubit, AllAreasState>(
        builder: (context, state) {
          final cubit = context.read<AllAreasCubit>();
          if (query != cubit.query) {
            cubit.refresh(query);
          }
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    selected: true,
                    selectedTileColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    leading: const Text("-"),
                    selectedColor:
                        Theme.of(context).textTheme.bodyMedium!.color,
                    onTap: () {
                      close(
                        context,
                        cubit.allAreas[index],
                      );
                    },
                    title: Text(
                      cubit.allAreas[index].name.toString(),
                    ),
                  );
                },
                itemCount: cubit.allAreas.length,
              ),
              if (state is AllAreasLoading)
                const SliverToBoxAdapter(
                  child: LoadingWidget(loadingSize: 24),
                )
            ],
          );
        },
      ),
    );
  }
}
