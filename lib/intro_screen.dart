import 'package:flutter/material.dart';
import 'package:mexpert_test/homedelivery.dart';
import 'package:mexpert_test/onlinepayment.dart';
import 'package:mexpert_test/onlineshopping.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  
  final PageController _pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26,158,183),
      body: PageView(
        controller: _pageViewController,
        children: const <Widget>[
         OnlinePayment(),
         OnlineShopping(),
         Homedelivery()
        ],
      ),
    );
  }
}