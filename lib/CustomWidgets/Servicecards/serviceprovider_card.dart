import 'package:flutter/material.dart';

class ServiceProviderCard extends StatelessWidget {
  final String name;
  final double rating;
  final int reviewCount;
  final int servicesDone;
  final int sinceYear;
  final int startingPrice;
  final String imagePath;

  const ServiceProviderCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.servicesDone,
    required this.sinceYear,
    required this.startingPrice,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${rating} ',
                            style: const TextStyle(fontSize: 13),
                          ),
                          const Icon(Icons.star, color: Colors.amber, size: 15),
                          Text(
                            '($reviewCount reviews)',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$servicesDone services has done since $sinceYear',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(indent: 10, endIndent: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Start's from  ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 14, 32, 47),
                        ),
                      ),
                    ),
                    Text(
                      '$startingPrice ₹',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 36, 90),
                      foregroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Hire Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
