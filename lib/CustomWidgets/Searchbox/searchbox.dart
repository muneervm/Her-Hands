import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final ValueChanged<String>? onChanged;

  const CommonSearchBar({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(255, 4, 36, 90),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(color: Colors.black),
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 4, 36, 90),
                      ),
                      hintText: hintText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/Icons/filter.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
