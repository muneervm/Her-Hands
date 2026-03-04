import 'package:flutter/material.dart';

Widget buildCategoryCard({
  required String imagePath,
  required String title,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 50,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
