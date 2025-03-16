
import 'package:career/core/global_views/all_governorates/cubit/all_governorates_cubit.dart';
import 'package:career/core/global_views/all_governorates/cubit/all_governorates_state.dart';
import 'package:career/core/global_views/all_governorates/repo/all_governorates_repo.dart';
import 'package:career/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGovernoratesSearchView extends SearchDelegate {
  AllGovernoratesSearchView();

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
      create: (context) => AllGovernoratesCubit(
        AllGovernoratesRepo(),
      )..onInit(),
      child: BlocBuilder<AllGovernoratesCubit, AllGovernoratesState>(
        builder: (context, state) {
          final cubit = context.read<AllGovernoratesCubit>();
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
                      close(context, cubit.allGovernorates[index]);
                    },
                    title: Text(
                      cubit.allGovernorates[index].name.toString(),
                    ),
                  );
                },
                itemCount: cubit.allGovernorates.length,
              ),
              if (state is AllGovernoratesLoading)
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
