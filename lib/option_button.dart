import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionButton extends StatelessWidget{
  const OptionButton({required this.optionText, required this.onPressed, super.key});

  final String optionText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20
          )
        ),
        child: Text(
          optionText,
          textAlign: TextAlign.center,  
          style: GoogleFonts.lato(),    
          )
        ),
    );

  }
}