import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justduit/screen/signup_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left:20, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Wellcome Back to Justduit",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  //Email
                  Row(
                    children: [
                      Text(
                        "Email Address",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: isEmailValid ? null : "Email tidak valid",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //Password
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: isPasswordValid ? null : "Password tidak valid",
                    ),
                  ),

                  //Forgot Password
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      "Forgot Password",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.blue[800])),
                    ),
                  ),

                  //Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEmailValid = emailController.text.isNotEmpty;
                          isPasswordValid = passwordController.text.isNotEmpty;
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue[600]),
                      child: Text(
                        "Sign In Now",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  //Signup Button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                              SignupScreen())
                          ));
                      },
                      child: Text(
                        "Create New Account",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
