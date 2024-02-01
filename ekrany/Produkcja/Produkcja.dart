// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tigms/screens/Produkcja/MagazynGet.dart';
import 'package:tigms/screens/Produkcja/SurowceGet.dart';
import 'package:tigms/stale/constants.dart';
import 'package:tigms/screens/Produkcja/RecepturyGet.dart';
import 'package:tigms/screens/Produkcja/ZleceniaGet.dart';

class Produkcja extends StatefulWidget {
  const Produkcja({super.key});

  @override
  State<Produkcja> createState() => _ProdukcjaState();
}

class _ProdukcjaState extends State<Produkcja> {
  var selectedIndex = 0;
  
  List screens = [const ZleceniaGet(), const MagazynGet(), const SurowceGet(), const RecepturyGet()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Produkcja Lody",
          style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 20.0, color: titleTextDarkColor)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            tabs: const [
              GButton(
                icon: Icons.precision_manufacturing_outlined,
                text: "Zlecenia",
              ),
              GButton(
                icon: Icons.insights_outlined,
                text: "Magazyn",
              ),
              GButton(
                icon: Icons.local_grocery_store_outlined,
                text: "Surowce",
              ),
              GButton(
                icon: Icons.description_outlined,
                text: "Receptury",
              ),
            ],
            gap: 8,
            color: titleTextDarkColor,
            activeColor: titleTextDarkColor,
            tabBackgroundColor: surfaceDarkColor,
            selectedIndex: selectedIndex,
            padding: const EdgeInsets.all(15.0),
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
