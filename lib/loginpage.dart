import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mexpert_test/homepage.dart';
import 'package:mexpert_test/otpscreen.dart';
import 'package:mexpert_test/signuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phonecontroller = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String verId = "";
  void verifyPhoneNumber() async {
    String number = phonecontroller.text;
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91 $number',
      verificationCompleted: (PhoneAuthCredential credential) {
        verId = credential.verificationId!;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verId = verificationId;
        print("verficationId $verId");
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return OtpScreen(verId: verId);
        }));
        print("code sent");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // ignore: unused_local_variable
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Successful sign-in
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sign-in Successfull")));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const Homepage(), // Replace with your HomePage widget
        ),
      );
    } on Exception catch (e) {
      print('exception->$e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Image(
                image: AssetImage("assets/images/splashimage.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Login to continue",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: phonecontroller,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    counterText: "",
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: "Phone Number",
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
                  onPressed: verifyPhoneNumber,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 26, 158, 183))),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Get Otp",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("or continue with"),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: signInWithGoogle,
                    child: Container(
                      child: const Column(
                        children: [
                          Icon(Icons.g_mobiledata),
                          Text("Google"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: const Column(
                      children: [
                        Icon(Icons.facebook),
                        Text("FaceBook"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 26, 158, 183),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 26, 158, 183)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
