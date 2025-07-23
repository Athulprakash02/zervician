
import 'package:flutter/material.dart';
import 'package:zervician/constants/app_text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.size,
    required this.buttonText,
     required this.color,
    required this.onpressed,
   
  });

  final Size size;
  final String buttonText;
  final Color color;

  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onBackground,
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: color,
        ),
        child: Text(
          buttonText,
          style:AppTextStyles.regularBoldButtonText,
        ),
      ),
    );
  }
}