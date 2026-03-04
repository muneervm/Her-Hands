import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_application/CustomWidgets/Profiledetailingcard/profilecards.dart';
import 'package:service_application/Screens/Welcomescreen/screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Color.fromARGB(255, 4, 36, 90),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: const Color.fromARGB(255, 4, 36, 90),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/profilepic/women.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text('Personal Information',
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Containers(
                label: 'Name',
                labelStyle: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w700),
                subLabelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 4, 36, 90),
                ),
                subLabel: 'Women',
                showIcon: false,
              ),
              const SizedBox(height: 5),
              Containers(
                label: 'Gender',
                labelStyle: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w700),
                subLabelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 4, 36, 90),
                ),
                subLabel: 'female',
                showIcon: false,
              ),
              const SizedBox(height: 5),
              Containers(
                label: 'Date of Birth',
                labelStyle: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w700),
                subLabelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 4, 36, 90),
                ),
                subLabel: '13-08-2001',
                showIcon: false,
              ),
              const SizedBox(height: 10),
              Divider(
                thickness: 2.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text('Contact Details',
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Containers(
                label: 'Phone Number',
                labelStyle: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w700),
                subLabelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 4, 36, 90),
                ),
                subLabel: '9744656196',
                showIcon: false,
              ),
              const SizedBox(height: 5),
              Containers(
                label: 'Email Address',
                labelStyle: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w700),
                subLabelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 4, 36, 90),
                ),
                subLabel: 'layana@gmail.com',
                showIcon: false,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Color.fromARGB(255, 4, 36, 90)),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()),
                              (route) => false);
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ))),
              )
            ],
          ),
        ));
  }
}
