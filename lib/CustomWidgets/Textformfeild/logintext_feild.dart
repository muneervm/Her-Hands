import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleObscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final double height;
  final Widget? prefixWidget;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.onToggleObscure,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.height = 60,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 4, 36, 90),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword ? obscureText : false,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                color: Color.fromARGB(255, 19, 35, 74),
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIcon: prefixWidget,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color.fromARGB(255, 19, 35, 74),
                      ),
                      onPressed: onToggleObscure,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
