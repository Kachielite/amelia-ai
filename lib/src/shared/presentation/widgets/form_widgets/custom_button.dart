import 'package:amelia/src/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


enum ButtonType { primary, secondary }

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.type});

  final void Function() onPressed;
  final String label;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: type.name == 'primary'
                  ? AppPallete.primaryColor
                  : AppPallete.secondaryColor,
              textStyle: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              minimumSize: const Size.fromHeight(55)),
          child: Text(label)),
    );
  }
}
