// home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spectrum Pal")),
      body: Center(child: Text("Welcome to Spectrum Pal")),
    );
  }
}

