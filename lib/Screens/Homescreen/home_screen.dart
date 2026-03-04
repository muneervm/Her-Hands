import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_application/CustomWidgets/CatogoriesScreen/catogorie_screen.dart';
import 'package:service_application/CustomWidgets/Searchbox/searchbox.dart';
import 'package:service_application/CustomWidgets/Servicecards/service_cards.dart';
import 'package:service_application/Screens/ServiceScreens/facial_services.dart';
import 'package:service_application/Screens/ServiceScreens/hair_care_services.dart';
import 'package:service_application/Screens/ServiceScreens/makeover_services.dart';
import 'package:service_application/Screens/ServiceScreens/service_screen.dart';
import 'package:service_application/Screens/ServiceScreens/waxing_thread_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 4, 36, 90),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Women',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'kerala, thrissur',
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 240, 194, 58),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  print('Notification tapped!');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/Icons/notify.png',
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 240, 138, 5),
                          Color.fromARGB(255, 238, 214, 183)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Nearby Beauty',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Salon Awaits!',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 35,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 4, 36, 90),
                                    foregroundColor: Colors.white,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'Book Now',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/Carousal/carousal.png',
                            width: 120,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  CommonSearchBar(
                    controller: _searchController,
                    hintText: "Search services",
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                    child: Text(
                      'All Categories',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 4, 36, 90),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCategoryCard(
                          imagePath: 'assets/Icons/haircut.png',
                          title: 'Haircut',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Haircare(),
                                ));
                          },
                        ),
                        buildCategoryCard(
                          imagePath: 'assets/Icons/makeup.png',
                          title: 'Makeover',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MakeoverServices(),
                                ));
                          },
                        ),
                        buildCategoryCard(
                          imagePath: 'assets/Icons/waxing.png',
                          title: 'Waxing & Threading',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => WaxingThreadService(),
                                ));
                          },
                        ),
                        buildCategoryCard(
                          imagePath: 'assets/Icons/facial.png',
                          title: 'Facials',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FacialServices(),
                                ));
                          },
                        ),
                        buildCategoryCard(
                          imagePath: 'assets/Icons/manicure.png',
                          title: 'Manicure & Pedicure',
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (_) => PlumberScreen(),
                            // ));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Text(
                          'Popular Services',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 4, 36, 90),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllServiceScreen()));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(0, 3, 5, 0),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'View all',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ServiceCard(
                    imageAsset: 'assets/Servicepics/hairspa.jpg',
                    title: 'Hair Spa',
                    subtitle: 'bring back the shine your hair deserves',
                    provider: 'Megha',
                    pricePerHour: '\ ₹200/hour',
                    imageHeight: 70,
                    onImageTap: () {},
                  ),
                  SizedBox(height: 5),
                  ServiceCard(
                    imageAsset: 'assets/Servicepics/keratine.png',
                    title: 'Keratin  Treatment',
                    subtitle: 'bring back the shine your hair deserves',
                    provider: 'Geetha',
                    pricePerHour: '\ ₹300/hour',
                    imageHeight: 70,
                    onImageTap: () {},
                  ),
                  SizedBox(height: 5),
                  ServiceCard(
                    imageAsset: 'assets/Servicepics/wedding.png',
                    title: 'Bridal MakeUp',
                    subtitle: 'special Makeover on your special day',
                    provider: 'Deepa',
                    pricePerHour: '\ ₹500/hour',
                    imageHeight: 70,
                    onImageTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
