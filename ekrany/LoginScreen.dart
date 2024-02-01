import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigms/stale/constants.dart';
import 'package:tigms/screens/Produkcja/Produkcja.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String enteredPin = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: kLinearGradientColors,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Image(
                image: AssetImage('assets/Logo.png'),
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'PIN',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 20.0, color: titleTextDarkColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: index < enteredPin.length
                            ? primaryColor
                            : backgroundDarkColor,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => numberButton(1 + 3 * i + index),
                    ).toList(),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextButton(onPressed: null, child: SizedBox()),
                    numberButton(0),
                    const TextButton(onPressed: null, child: SizedBox()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 6) {
              enteredPin += number.toString();
            }
          });
          for (int i = 0; i < pins.length; i++) {
            if (enteredPin == pins[i].toString()) {
              isAdmin = enteredPin == '111111' ? true : false;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => 
                const Produkcja()),
              );
              enteredPin = '';
            }
          }
          if (enteredPin.length == 6) {
            enteredPin = '';
          }
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: backgroundDarkColor,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: 20.0,
                color: titleTextDarkColor,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
