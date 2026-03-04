import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Containers({
  required String label,
  String? subLabel,
  VoidCallback? onTap,
  bool showIcon = true,
  IconData? leadingIcon,
  TextStyle? labelStyle,
  TextStyle? subLabelStyle,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              if (leadingIcon != null)
                Icon(leadingIcon,
                    color: Color.fromARGB(255, 13, 56, 55), size: 22),
              if (leadingIcon != null) const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("$label:  ",
                        style: labelStyle ??
                            GoogleFonts.poppins(
                                fontSize: 16, color: Colors.teal)),
                    if (subLabel != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          subLabel,
                          style: subLabelStyle ??
                              const TextStyle(fontSize: 13, color: Colors.teal),
                        ),
                      ),
                  ],
                ),
              ),
              if (showIcon)
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromARGB(255, 13, 56, 55),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
