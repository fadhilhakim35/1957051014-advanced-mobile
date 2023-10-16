import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justduit/screen/UTP/list_post_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = true;

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
                'assets/images/logo2.png',
                width: 200,
              ),
            ),
            
            //PhoneNumber
            Row(
              children: [
                Text(
                  "Phone Number",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                errorText: isPhoneValid ? null : "Phone number doesn't valid",
              ),
            ),
            
            //Submit Button
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPhoneValid = phoneController.text.isNotEmpty.length[12];
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                            ListPostScreen())
                        )
                      );
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}