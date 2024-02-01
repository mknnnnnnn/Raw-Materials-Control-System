// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tigms/stale/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecepturyPost extends StatefulWidget {
  const RecepturyPost({super.key});

  @override
  State<RecepturyPost> createState() => _RecepturyPostState();
}

class _RecepturyPostState extends State<RecepturyPost> {
  final nazwa = TextEditingController();
  final skladnik1 = TextEditingController();
  final gramatura1 = TextEditingController();
  final skladnik2 = TextEditingController();
  final gramatura2 = TextEditingController();
  final skladnik3 = TextEditingController();
  final gramatura3 = TextEditingController();
  final skladnik4 = TextEditingController();
  final gramatura4 = TextEditingController();
  final skladnik5 = TextEditingController();
  final gramatura5 = TextEditingController();
  final skladnik6 = TextEditingController();
  final gramatura6 = TextEditingController();
  final skladnik7 = TextEditingController();
  final gramatura7 = TextEditingController();
  final skladnik8 = TextEditingController();
  final gramatura8 = TextEditingController();
  final skladnik9 = TextEditingController();
  final gramatura9 = TextEditingController();
  final skladnik10 = TextEditingController();
  final gramatura10 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Dodaj",
          style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 20.0, color: titleTextDarkColor)),
        ),
        centerTitle: true,
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 25,
                  decoration: BoxDecoration(
                      color: surfaceDarkColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Center(
                    child: Text(
                      "Parametry",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 15.0, color: titleTextDarkColor)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTextEditingControler(nazwa, "Nazwa receptury"),
                        buildTextEditingControler(skladnik1, "Skladnik 1"),
                        buildTextEditingControler(gramatura1, "Gramatura 1"),
                        buildTextEditingControler(skladnik2, "Skladnik 2"),
                        buildTextEditingControler(gramatura2, "Gramatura 2"),
                        buildTextEditingControler(skladnik3, "Skladnik 3"),
                        buildTextEditingControler(gramatura3, "Gramatura 3"),
                        buildTextEditingControler(skladnik4, "Skladnik 4"),
                        buildTextEditingControler(gramatura4, "Gramatura 4"),
                        buildTextEditingControler(skladnik5, "Skladnik 5"),
                        buildTextEditingControler(gramatura5, "Gramatura 5"),
                        buildTextEditingControler(skladnik6, "Skladnik 6"),
                        buildTextEditingControler(gramatura6, "Gramatura 6"),
                        buildTextEditingControler(skladnik7, "Skladnik 7"),
                        buildTextEditingControler(gramatura7, "Gramatura 7"),
                        buildTextEditingControler(skladnik8, "Skladnik 8"),
                        buildTextEditingControler(gramatura8, "Gramatura 8"),
                        buildTextEditingControler(skladnik9, "Skladnik 9"),
                        buildTextEditingControler(gramatura9, "Gramatura 9"),
                        buildTextEditingControler(skladnik10, "Skladnik 10"),
                        buildTextEditingControler(gramatura10, "Gramatura 10"),
                      ],
                    ),
                  )),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      sendPostRequest();
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: titleTextDarkColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendPostRequest() async {
    await http.post(
        Uri.parse(
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/postReceptury"),
        body: jsonEncode({
          "nazwa": nazwa.text.toString().isEmpty ? "" : nazwa.text,
          "skladnik1": skladnik1.text.toString().isEmpty ? "" : skladnik1.text,
          "gramatura1": gramatura1.text.toString().isEmpty
              ? null
              : int.parse(gramatura1.text),
          "skladnik2": skladnik2.text.toString().isEmpty ? "" : skladnik2.text,
          "gramatura2": gramatura2.text.toString().isEmpty
              ? null
              : int.parse(gramatura2.text),
          "skladnik3": skladnik3.text.toString().isEmpty ? "" : skladnik3.text,
          "gramatura3": gramatura3.text.toString().isEmpty
              ? null
              : int.parse(gramatura3.text),
          "skladnik4": skladnik4.text.toString().isEmpty ? "" : skladnik4.text,
          "gramatura4": gramatura4.text.toString().isEmpty
              ? null
              : int.parse(gramatura4.text),
          "skladnik5": skladnik5.text.toString().isEmpty ? "" : skladnik5.text,
          "gramatura5": gramatura5.text.toString().isEmpty
              ? null
              : int.parse(gramatura5.text),
          "skladnik6": skladnik6.text.toString().isEmpty ? "" : skladnik6.text,
          "gramatura6": gramatura6.text.toString().isEmpty
              ? null
              : int.parse(gramatura6.text),
          "skladnik7": skladnik7.text.toString().isEmpty ? "" : skladnik7.text,
          "gramatura7": gramatura7.text.toString().isEmpty
              ? null
              : int.parse(gramatura7.text),
          "skladnik8": skladnik8.text.toString().isEmpty ? "" : skladnik8.text,
          "gramatura8": gramatura8.text.toString().isEmpty
              ? null
              : int.parse(gramatura8.text),
          "skladnik9": skladnik9.text.toString().isEmpty ? "" : skladnik9.text,
          "gramatura9": gramatura9.text.toString().isEmpty
              ? null
              : int.parse(gramatura9.text),
          "skladnik10":
              skladnik10.text.toString().isEmpty ? "" : skladnik10.text,
          "gramatura10": gramatura10.text.toString().isEmpty
              ? null
              : int.parse(gramatura10.text),
        }));
  }

  Widget buildTextEditingControler(
      TextEditingController? textEditingController, String? text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          style: const TextStyle(fontSize: 15.0, color: primaryColor),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              fillColor: surfaceDarkColor,
              filled: true,
              hintStyle:
                  const TextStyle(fontSize: 15.0, color: titleTextDarkColor),
              hintText: text),
          controller: textEditingController,
        ),
      ),
    );
  }
}
