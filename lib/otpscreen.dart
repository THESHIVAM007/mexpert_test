import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mexpert_test/homepage.dart';
import 'package:mexpert_test/signuppage.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verId});
  final String verId;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController otpController = TextEditingController();

  Future<void> signInWithPhoneNumber() async {
    String smsCode = otpController.text;
    print(smsCode);
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verId,   
        smsCode: smsCode,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Check if the user already exists in Firestore
      DocumentSnapshot userSnapshot = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userSnapshot.exists) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign-in Successfull")));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
      } else {
        // User does not exist, navigate to ProfilePage to complete profile
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Please SignUp First")));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SignUpPage();
        }));
      }
    } catch (e) {
      print('Error signing in with phone number: $e');
    }
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
 otpController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              const Text("OTP Verification",style: TextStyle( fontSize: 24,fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
              const Text(
                  "Enter the verification code we just sent on your phone Number.",textAlign: TextAlign.center,),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: otpController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: "Enter OTP",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: ElevatedButton(
                  onPressed: signInWithPhoneNumber,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 26, 158, 183))),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Verify",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
