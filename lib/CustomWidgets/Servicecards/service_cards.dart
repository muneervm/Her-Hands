import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCard extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String provider;
  final String pricePerHour;
  final VoidCallback onImageTap;
  final double? imageHeight;
  final double? imageWidth;

  const ServiceCard({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.provider,
    required this.pricePerHour,
    required this.onImageTap,
    this.imageHeight,
    this.imageWidth,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 7,
            color: Colors.black12,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onImageTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imageAsset,
                height: widget.imageHeight ?? 80,
                width: widget.imageWidth ?? 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(255, 4, 36, 90),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: isLiked ? Colors.orangeAccent : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  widget.subtitle,
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size: 15, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          widget.provider,
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 15, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          widget.pricePerHour,
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
