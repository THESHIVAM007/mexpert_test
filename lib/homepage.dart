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
        title: Image.asset("assets/images/splashimage.png",height: 50,),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.qr_code_scanner_rounded),)
        ],
      ),
    );
  }
}
