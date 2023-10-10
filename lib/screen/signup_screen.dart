import 'package:flutter/material.dart';
import 'package:justduit/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //Image
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
            ),
            
            //Wellcome Text
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 10),
              child: Row (
                children: [
                  Expanded(child: 
                    Text(
                      "Sign Up Now and Unlock The Power Of Justduit",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
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
                  //Full Name
                  Row(
                    children: [
                      Text(
                        "Full Name",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: isNameValid ? null : "Nama tidak boleh kosong",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //Email Address
                  Row(
                    children: [
                      Text(
                        "Email Address",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                      errorText: isEmailValid ? null : "Email tidak boleh kosong",
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
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                      errorText: isPasswordValid ? null : "Password tidak boleh kosong",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //Confirm Password
                  Row(
                    children: [
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                    controller: confirmController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: isConfirmValid ? null : "Password tidak boleh kosong",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isNameValid = nameController.text.isNotEmpty;
                          isEmailValid = emailController.text.isNotEmpty;
                          isPasswordValid = passwordController.text.isNotEmpty;
                          isConfirmValid = confirmController.text == passwordController.text;
                        });
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue[600]),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  //Signin Button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen()));
                      },
                      child: Text(
                        "Sign In",
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
