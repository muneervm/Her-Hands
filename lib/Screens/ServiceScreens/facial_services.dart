import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_application/CustomWidgets/Searchbox/searchbox.dart';
import 'package:service_application/CustomWidgets/Servicecards/service_cards.dart';

class FacialServices extends StatefulWidget {
  const FacialServices({super.key});

  @override
  State<FacialServices> createState() => _FacialServicesState();
}

class _FacialServicesState extends State<FacialServices> {
  final TextEditingController _searchserviceController =
      TextEditingController();

  final List<Map<String, dynamic>> allServices = [
    {
      "imageAsset": 'assets/Servicepics/skincare.jpg',
      "title": 'Skin Care services',
      "subtitle": 'Expertised Services',
      "provider": 'nandhana',
      "pricePerHour": '\ ₹200/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/skinbrightning.png',
      "title": 'Skin brightening facials',
      "subtitle": 'Expertised skincare services',
      "provider": 'Anjali',
      "pricePerHour": '\ ₹200/hour',
    },
    {
      "imageAsset": 'assets/Servicepics/antiaging.png',
      "title": 'Anti-aging facials',
      "subtitle": 'Glow naturally with facial treatments.',
      "provider": 'aishwarya',
      "pricePerHour": '\ ₹250/hour',
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
          'Facial  Services',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
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
