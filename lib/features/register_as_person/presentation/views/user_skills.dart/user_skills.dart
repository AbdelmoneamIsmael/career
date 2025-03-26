import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/global_views/skills/model/skills_responce.dart';
import 'package:career/core/global_views/skills/view/get_all_skills.dart';
import 'package:career/core/src/language.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSkills extends StatelessWidget {
  const UserSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsPersonCubit, RegisterAsPersonState>(
      builder: (context, state) {
        final cubit = context.read<RegisterAsPersonCubit>();
        return Column(children: [
          PrimaryContainer(
            // padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 16.h,
              children: [
                TitleWidget(
                  title: AppLocalizations.of(context).personalSkill,
                  onTap: () => context.read<RegisterAsPersonCubit>().previous(),
                ),
                const SizedBox(),
                AppTextField(
                  ontap: () {
                    showSearch(
                      context: context,
                      delegate: LanguageSearchView(
                        provider: cubit,
                      ),
                    );
                  },
                  hint: AppLocalizations.of(context).language,
                  prefixIcon: const Icon(Icons.language),
                ),
                Wrap(
                  spacing: 8.w,
                  children: cubit.registerModel.languages
                      .map((e) => Chip(
                            label: Text(e),
                            onDeleted: () => cubit.deleteLanguage(e),
                          ))
                      .toList(),
                ),
                const SizedBox(),
                AppTextField(
                  ontap: () async {
                    Skill? x = await showSearch(
                      context: context,
                      delegate: SkillsSearchView(),
                    ) as Skill?;
                    if (x != null) {
                      cubit.addSkills(x);
                    }
                  },
                  hint: AppLocalizations.of(context).personalSkill,
                  prefixIcon: const Icon(Icons.account_box),
                ),
                Wrap(
                  spacing: 8.w,
                  children: cubit.selectedSkills
                      .map((e) => Chip(
                            label: Text(e.name ?? ''),
                            onDeleted: () => cubit.deleteSkill(e),
                          ))
                      .toList(),
                ),
                ForwardWidget(
                  onPressed: () {
                    if (cubit.cheeckSkillValidation(context)) {
                      context.read<RegisterAsPersonCubit>().register();
                    }
                  },
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}

class LanguageSearchView extends SearchDelegate {
  LanguageSearchView({required this.provider});
  final RegisterAsPersonCubit provider;
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
    var suggestions = popularLanguages
        .where(
          (element) =>
              element.toString().toLowerCase().contains(query.toLowerCase()) ||
              element.toString().toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return BlocProvider.value(
      value: provider,
      child: BlocBuilder<RegisterAsPersonCubit, RegisterAsPersonState>(
        builder: (context, state) {
          final cubit = context.read<RegisterAsPersonCubit>();
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                selected: true,
                selectedTileColor:
                    Theme.of(context).colorScheme.primaryContainer,
                leading: const Text("-"),
                selectedColor: Theme.of(context).textTheme.bodyMedium!.color,
                onTap: () {
                  cubit.addLanguageToUser(suggestions[index]);
                  close(context, null);
                },
                title: Text(
                  suggestions[index].toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
