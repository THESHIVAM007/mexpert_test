import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/splashimage.png",
          height: 50,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner_rounded),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
         currentIndex: 1,
         showUnselectedLabels: true,
         
        items: const [
        BottomNavigationBarItem(

            backgroundColor: Colors.grey,
            icon: Icon(
              Icons.home,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.category),
            label: "Category"),
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.message),
            label: "Message"),
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.shopping_cart),
            label: "cart"),
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.person),
            label: "private"),
      ]),
    );
  }
}
