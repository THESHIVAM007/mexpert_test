import 'package:flutter/material.dart';
import 'package:mexpert_test/loginpage.dart';

class Homedelivery extends StatefulWidget {
  const Homedelivery({super.key});

  @override
  State<Homedelivery> createState() => _HomedeliveryState();
}

class _HomedeliveryState extends State<Homedelivery> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Center(
            child: Image(
              image: AssetImage("assets/images/pana.png"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Home Deliver Service",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Skip >>",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),const Spacer(),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage(),));
                          },
                          shape: const CircleBorder(),
                          backgroundColor: Colors.orange,
                          child: const Icon(Icons.arrow_forward_outlined),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
