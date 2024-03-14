import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              //border: InputBorder.none,
              hintText: 'بحث',
            ),
          ),
        ],
      ),
    );
  }
}
