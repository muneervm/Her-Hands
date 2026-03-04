import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_application/CustomWidgets/Searchbox/searchbox.dart';
import 'package:service_application/CustomWidgets/Servicecards/service_cards.dart';

class AllServiceScreen extends StatefulWidget {
  const AllServiceScreen({super.key});

  @override
  State<AllServiceScreen> createState() => _AllServiceScreenState();
}

class _AllServiceScreenState extends State<AllServiceScreen> {
  final TextEditingController _searchserviceController =
      TextEditingController();

  final List<Map<String, dynamic>> allServices = [
    {
      "imageAsset": 'assets/Servicepics/garment.jpg',
      "title": 'Garment Reconstruction',
      "subtitle": 'Expertised Working',
      "provider": 'Anakha',
      "pricePerHour": '\ ₹180/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/hairstyle.jpg',
      "title": 'Hair Stylist',
      "subtitle": 'Expertised Hair Stylist',
      "provider": 'Megaha',
      "pricePerHour": '\ ₹200/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/skincare.jpg',
      "title": 'Skin Care',
      "subtitle": 'Complete skin care solution',
      "provider": 'Abhirami',
      "pricePerHour": '\ ₹230/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/Tailoring.jpg',
      "title": 'Tailoring',
      "subtitle": 'Expertised Tailoring service',
      "provider": 'Antony',
      "pricePerHour": '\ ₹250/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/embroidary.jpg',
      "title": 'Hand Embroidary',
      "subtitle": 'Expertised Services',
      "provider": 'Akhila',
      "pricePerHour": '\ ₹300/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/hairspa.jpg',
      "title": 'Hair Care',
      "subtitle": 'Expertised Hair care solution ',
      "provider": 'Anjali',
      "pricePerHour": '\ ₹200/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/wedding.png',
      "title": ' Bridal Makeover',
      "subtitle": 'special makeover on your special day',
      "provider": 'divya',
      "pricePerHour": '\ ₹500/hour',
    },
  ];

  List<Map<String, dynamic>> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices = List.from(allServices);
  }

  void _filterServices(String query) {
    final result = allServices.where((service) {
      final title = service['title'].toString().toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredServices = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 4, 36, 90),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'All Services',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CommonSearchBar(
                controller: _searchserviceController,
                hintText: "Search services",
                onChanged: _filterServices,
              ),
              const SizedBox(height: 30),
              Text(
                'Available Services',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 4, 36, 90),
                ),
              ),
              const SizedBox(height: 10),
              ...filteredServices.map((service) => Column(
                    children: [
                      ServiceCard(
                        imageAsset: service['imageAsset'],
                        title: service['title'],
                        subtitle: service['subtitle'],
                        provider: service['provider'],
                        pricePerHour: service['pricePerHour'],
                        imageHeight: 70,
                        onImageTap: () {},
                      ),
                      const SizedBox(height: 5),
                    ],
                  )),
              if (filteredServices.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "No services found.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
