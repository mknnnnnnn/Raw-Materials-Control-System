// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tigms/stale/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SurowcePut extends StatefulWidget {
  final nazwa;
  const SurowcePut({super.key, this.nazwa});

  @override
  State<SurowcePut> createState() => _SurowcePutState();
}

class _SurowcePutState extends State<SurowcePut> {
  final gramatura = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Edytuj",
          style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 20.0, color: titleTextDarkColor)),
        ),
        centerTitle: true,
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
                      "${widget.nazwa}",
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
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 15.0, color: primaryColor),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: surfaceDarkColor,
                                  filled: true,
                                  hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: titleTextDarkColor),
                                  hintText: "Gramatura"),
                              controller: gramatura,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        sendPutRequest();
                      },
                      icon: const Icon(
                        Icons.update_outlined,
                        color: titleTextDarkColor,
                      )),
                  IconButton(
                      onPressed: () {
                        sendDeleteRequest();
                      },
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: titleTextDarkColor,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendPutRequest() async {
    await http.put(
        Uri.parse(
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/putSurowce"),
        body: jsonEncode({
          "nazwa": widget.nazwa,
          "gramatura": int.parse(gramatura.text),
        }));
  }

  Future<void> sendDeleteRequest() async {
    await http.put(
        Uri.parse(
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/deteteSurowce"),
        body: jsonEncode({
          "nazwa": widget.nazwa,
        }));
  }
}
