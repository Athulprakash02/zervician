
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextFieldWidget extends StatelessWidget {
  AuthTextFieldWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.keyboardType,
    this.maxLength,
    required this.obscureText,
    required this.prefixIcon,
    
    this.validator,
    this.isEnable
  });
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool obscureText;
  final Icon prefixIcon;
  
  bool? isEnable;
  final String? Function(String?)? validator;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        enabled: isEnable,
        controller: textEditingController,
        // focusNode: focusNode,
        keyboardType: keyboardType,
        maxLength: maxLength,
        obscureText: obscureText,
        style: const TextStyle(),
        cursorColor: Theme.of(context).colorScheme.onBackground,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: hintText,
          labelStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
          counterText: '',
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          focusColor: Theme.of(context).colorScheme.onBackground,
         
          errorStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(12)),
        ),
        validator: validator,
      ),
    );
  }
}
