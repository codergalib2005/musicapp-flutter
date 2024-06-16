import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButon extends StatelessWidget {
  final String btnText;
  const AuthGradientButon({super.key, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Pallete.gradient1, Pallete.gradient2],
            begin: Alignment.topLeft,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(395, 55),
              backgroundColor: Pallete.transparentColor,
              shadowColor: Pallete.transparentColor),
          child: Text(
            btnText,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
          )),
    );
  }
}
