import 'package:baia_ui/constants.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double widthScale;
  const AppTextButton({super.key, this.onPressed, required this.text, this.widthScale = 0.9});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.038,
              width: MediaQuery.of(context).size.width * widthScale,
              decoration: BoxDecoration(
                color: mainBlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
