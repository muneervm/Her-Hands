import 'package:flutter/material.dart';
import 'package:service_application/CustomWidgets/Servicecards/serviceprovider_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        // leading: Container(
        //   margin: const EdgeInsets.all(8),
        //   decoration: const BoxDecoration(
        //     color: Colors.white10,
        //     shape: BoxShape.circle,
        //   ),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       size: 20,
        //     ),
        //     padding: EdgeInsets.zero,
        //   ),
        // ),
        title: const Text(
          'Nearby Service Provider',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 4, 36, 90),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ServiceProviderCard(
              name: "Selvi",
              rating: 4.8,
              reviewCount: 120,
              servicesDone: 150,
              sinceYear: 2015,
              startingPrice: 1200,
              imagePath: 'assets/Serviceproviders/chinnamma.jpg',
            ),
            ServiceProviderCard(
              name: "Akhila",
              rating: 4.8,
              reviewCount: 120,
              servicesDone: 300,
              sinceYear: 2015,
              startingPrice: 100,
              imagePath: 'assets/Serviceproviders/akhila.jpeg',
            ),
            ServiceProviderCard(
              name: "Abinaya",
              rating: 4.8,
              reviewCount: 120,
              servicesDone: 50,
              sinceYear: 2015,
              startingPrice: 600,
              imagePath: 'assets/Serviceproviders/abinaya.jpg',
            ),
            ServiceProviderCard(
              name: "Geetha",
              rating: 4.8,
              reviewCount: 100,
              servicesDone: 30,
              sinceYear: 2019,
              startingPrice: 900,
              imagePath: 'assets/Serviceproviders/geetha.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
