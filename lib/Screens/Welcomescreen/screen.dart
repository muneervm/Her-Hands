import 'package:flutter/material.dart';
import 'package:service_application/Screens/Registerpage/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 180),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/welcomepic.png',
                  height: 300,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: const [
                            TextSpan(
                                text: "Her",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 19, 35, 74),
                                )),
                            TextSpan(
                                text: " - ",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            TextSpan(
                                text: "Hands",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFC107))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Find experienced professional near you.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                            (route) => false,
                          );
                          setState(() {
                            _isLoading = false;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 19, 35, 74),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Color.fromARGB(255, 19, 35, 74),
                        )),
                  ),
                  child: _isLoading
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                              backgroundColor: Color(0xFFFFC107)),
                        )
                      : const Text(
                          'Get Started',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
