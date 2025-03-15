import 'package:career/core/global_views/skills/cubit/skills_cubit.dart';
import 'package:career/core/global_views/skills/cubit/skills_state.dart';
import 'package:career/core/global_views/skills/repo/skills_repo.dart';
import 'package:career/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillsSearchView extends SearchDelegate {
  SkillsSearchView();

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
      create: (context) => SkillsCubit(
        SkillsRepo(),
      )..onInit(),
      child: BlocBuilder<SkillsCubit, SkillsState>(
        builder: (context, state) {
          final cubit = context.read<SkillsCubit>();
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
                      close(context, cubit.skills[index]);
                    },
                    title: Text(
                      cubit.skills[index].name.toString(),
                    ),
                  );
                },
                itemCount: cubit.skills.length,
              ),
              if (state is SkillsLoading)
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
