// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grafos1_bus/service/home_service.dart';

class HomeSuggestField extends StatefulWidget {
  const HomeSuggestField({Key? key, required this.suggestions})
      : super(key: key);

  final List<String> suggestions;

  @override
  State<HomeSuggestField> createState() => _HomeSuggestFieldState();
}

class _HomeSuggestFieldState extends State<HomeSuggestField> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      width: size.width * 0.65,
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: TypeAheadFormField(
        onSaved: (String? value) {
          if (value != null) {}
        },
        suggestionsCallback: (value) {
          return HomeService.buildSuggestions(value);
        },
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            hintText: "Salvador - BA",
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
            border: InputBorder.none,
          ),
          controller: _controller,
        ),
        noItemsFoundBuilder: (context) => SizedBox(
          height: 60,
          child: Center(
            child: Text(
              "Sem cidades para a pesquisa!",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onSuggestionSelected: (value) {
          _controller.text = value == null ? "" : value.toString();
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.toString()),
          );
        },
      ),
    );
  }
}
