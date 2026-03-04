import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_application/CustomWidgets/Textformfeild/logintext_feild.dart';
import 'package:service_application/Screens/BottomNav/bottom_nav_screen.dart';
import 'package:service_application/Screens/Registerpage/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  final _formKey2 = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        "Login  Here.....",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 4, 36, 90),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Find experienced professional near you",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 80),
                      CustomTextField(
                        label: "Email",
                        hint: "Your email",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email address';
                          } else if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 1),
                      const SizedBox(height: 1),
                      CustomTextField(
                        label: "Password",
                        hint: "******",
                        controller: passwordController,
                        isPassword: true,
                        obscureText: _obscurePassword,
                        onToggleObscure: _togglePasswordVisibility,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    if (_formKey2.currentState!.validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      await Future.delayed(
                                          Duration(seconds: 2));

                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavScreen()),
                                        (route) => false,
                                      );

                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 19, 35, 74),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 19, 35, 74),
                                ),
                              ),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      backgroundColor: Color(0xFFFFC107),
                                    ),
                                  )
                                : const Text(
                                    'Log In',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                                (route) => false);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account ? ",
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 19, 35, 74),
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: GoogleFonts.poppins(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
