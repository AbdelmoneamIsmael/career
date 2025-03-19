import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/model/app_model/app_model.dart';
import 'package:career/core/src/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate(this.searchController);
  final TextEditingController searchController;
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
    var suggestions = countries
        .where(
          (element) =>
              element["en"]
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element["ar"]
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          selected: true,
          selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
          leading: const Text("-"),
          selectedColor: Theme.of(context).textTheme.bodyMedium!.color,
          onTap: () {
            searchController.text = context.read<AppBloc>().appModel.language ==
                    ApplicationLanguage.en
                ? suggestions[index]["en"].toString()
                : suggestions[index]["ar"].toString();
            close(context, CountryModel.fromJson(suggestions[index]));
          },
          title: Text(
            context.read<AppBloc>().appModel.language == ApplicationLanguage.en
                ? suggestions[index]["en"].toString()
                : suggestions[index]["ar"].toString(),
          ),
        );
      },
    );
  }
}
