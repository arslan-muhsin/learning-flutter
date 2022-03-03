import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String placeholder;
  final Color placeholderColor;
  final Color textColor;
  final bool obscureText;
  final bool enableSuggestion;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final Function(String?) onChanged;

  const TextInputField({
    Key? key,
    required this.placeholder,
    required this.placeholderColor,
    required this.textColor,
    required this.onChanged,
    this.obscureText = false,
    this.enableSuggestion = true,
    this.autocorrect = true,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: enableSuggestion,
      autocorrect: autocorrect,
      style: TextStyle(
        color: textColor,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: placeholderColor,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
