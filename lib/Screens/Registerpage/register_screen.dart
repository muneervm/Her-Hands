import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_application/CustomWidgets/Textformfeild/logintext_feild.dart';
import 'package:service_application/Screens/BottomNav/bottom_nav_screen.dart';
import 'package:service_application/Screens/LoginScreen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        "Register your account",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 4, 36, 90),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Find experienced professional near you",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        label: "Name",
                        hint: "Your name",
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                            return 'Only letters allowed';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 1),
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
                      CustomTextField(
                        label: "Phone",
                        hint: "Enter Phone number",
                        controller: phoneController,
                        prefixWidget: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/Logo/flag.png",
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                "+91",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 2),
                            ],
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Phone Number';
                          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Please enter a valid Phone Number';
                          } else if (value.length != 10) {
                            return 'Phone Number must be exactly 10 digits';
                          }
                          return null;
                        },
                      ),
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
                      const SizedBox(height: 140),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
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
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 19, 35, 74),
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: " Log In",
                                style: GoogleFonts.poppins(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (route) => false,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
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
