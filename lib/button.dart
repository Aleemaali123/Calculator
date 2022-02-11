import "package:flutter/material.dart";

class AllButtons extends StatelessWidget {
  AllButtons(
      {required this.buttoncolor,
      required this.buttontext,
      required this.buttontextcolor,
      this.onPressed});

  Color buttoncolor;
  String buttontext;
  Color buttontextcolor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: buttoncolor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              buttontext,
              style: TextStyle(
                color: buttontextcolor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
