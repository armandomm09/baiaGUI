import 'dart:ui';

import 'package:baia_ui/constants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final void Function(String)? onSubmitted;
  const AppTextField({super.key, this.controller, this.hintText, this.isPassword = false, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 40,
        child: TextField(
          onSubmitted: onSubmitted,
          obscureText: isPassword,
            style:
                const TextStyle(color: mainGreyColor, fontWeight: FontWeight.bold, fontSize: 14),
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              labelStyle: TextStyle(
                // height: 40,
                  color: mainGreyColor.withOpacity(0.3),
                  fontWeight: FontWeight.w400,
                  // fontSize: 16
                  ),
              labelText: hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            )),
      ),
    );
  }
}
