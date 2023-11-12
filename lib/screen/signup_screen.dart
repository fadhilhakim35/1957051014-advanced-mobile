import 'package:flutter/material.dart';
import 'package:justduit/screen/root_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void setValue(String name, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("email", email);
  }

  void redirect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("name")) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => rootScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    redirect();
  }

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
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () async {
                            setState(() {
                              isEmailValid =
                                  emailController.text.contains('@') &&
                                      emailController.text.isNotEmpty;
                              isNameValid = nameController.text.isNotEmpty;
                              isPasswordValid = passwordController.text.isNotEmpty;
                              isConfirmValid =
                                  passwordController.text == confirmController.text &&
                                      confirmController.text.isNotEmpty &&
                                      isPasswordValid;
                            });

                            if (isConfirmValid && isEmailValid && isNameValid) {
                              setValue(
                                  nameController.text, emailController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => rootScreen(),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Continue",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      // //Signin Button
                      // Center(
                      //   child: TextButton(
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen()));
                      //     },
                      //     child: Text(
                      //       "Sign In",
                      //       style: GoogleFonts.poppins(
                      //         textStyle: TextStyle(color: Colors.grey),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
