import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomeSuggestField extends StatefulWidget {
  const HomeSuggestField({Key? key}) : super(key: key);

  @override
  State<HomeSuggestField> createState() => _HomeSuggestFieldState();
}

class _HomeSuggestFieldState extends State<HomeSuggestField> {
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
          return [];
        },
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
              hintText: "Salvador - BA",
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
              border: InputBorder.none),
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
          setState(() {});
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