import 'package:flutter/material.dart';

class SearchTextWidget extends StatelessWidget {
  final Function(String query) onChanged;

  const SearchTextWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      autofocus: true,
      //Display the keyboard when TextField is displayed
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      //Specify the action button on the keyboard
      decoration: const InputDecoration(
        //Style of TextField
        enabledBorder: UnderlineInputBorder(
            //Default TextField border
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            //Borders when a TextField is in focus
            borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle(
          //Style of hintText
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }
}
