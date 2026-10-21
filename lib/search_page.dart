import 'package:flutter/material.dart';

class MySearch extends StatelessWidget {
  const MySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySearchSelectorPage(),
    );
  }
}

class MySearchSelectorPage extends StatefulWidget {
  const MySearchSelectorPage({super.key});

  @override
  _MySearchSelectorPage createState() => _MySearchSelectorPage();
}

class _MySearchSelectorPage extends State<MySearchSelectorPage> {
  final List<String> countries = [
    "Mohammed Ouais",
    "Ouais",
    "Mohammed",
    "Ail",
    "Ahmed",
    "Mostafa",
    "Anwar",
    "Omar",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSearch(
        context: context,
        delegate: CountrySearch(
          countries,
          onCountrySelected: (country) {
            print("Selected: $country");
            Navigator.pop(context);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

class CountrySearch extends SearchDelegate<String> {
  final List<String> countries;
  final Function(String) onCountrySelected;

  CountrySearch(this.countries, {required this.onCountrySelected});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = countries
        .where((country) => country.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            onCountrySelected(results[index]);
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = countries
        .where((country) => country.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
