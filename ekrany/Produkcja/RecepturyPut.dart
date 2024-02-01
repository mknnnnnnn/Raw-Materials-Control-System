// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tigms/stale/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RecepturyPut extends StatefulWidget {
  final id;
  final nazwa;
  final skladnik1;
  final gramatura1;
  final skladnik2;
  final gramatura2;
  final skladnik3;
  final gramatura3;
  final skladnik4;
  final gramatura4;
  final skladnik5;
  final gramatura5;
  final skladnik6;
  final gramatura6;
  final skladnik7;
  final gramatura7;
  final skladnik8;
  final gramatura8;
  final skladnik9;
  final gramatura9;
  final skladnik10;
  final gramatura10;
  const RecepturyPut(
      {super.key,
      this.nazwa,
      this.id,
      this.skladnik1,
      this.gramatura1,
      this.skladnik2,
      this.gramatura2,
      this.skladnik3,
      this.gramatura3,
      this.skladnik4,
      this.gramatura4,
      this.skladnik5,
      this.gramatura5,
      this.skladnik6,
      this.gramatura6,
      this.skladnik7,
      this.gramatura7,
      this.skladnik8,
      this.gramatura8,
      this.skladnik9,
      this.gramatura9,
      this.skladnik10,
      this.gramatura10});

  @override
  State<RecepturyPut> createState() => _RecepturyPutState();
}

class _RecepturyPutState extends State<RecepturyPut> {
  final gramaturaa1 = TextEditingController();
  final gramaturaa2 = TextEditingController();
  final gramaturaa3 = TextEditingController();
  final gramaturaa4 = TextEditingController();
  final gramaturaa5 = TextEditingController();
  final gramaturaa6 = TextEditingController();
  final gramaturaa7 = TextEditingController();
  final gramaturaa8 = TextEditingController();
  final gramaturaa9 = TextEditingController();
  final gramaturaa10 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Edytuj",
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
                        widget.skladnik1.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa1, widget.skladnik1)
                            : const SizedBox(),
                        widget.skladnik2.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa2, widget.skladnik2)
                            : const SizedBox(),
                        widget.skladnik3.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa3, widget.skladnik3)
                            : const SizedBox(),
                        widget.skladnik4.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa4, widget.skladnik4)
                            : const SizedBox(),
                        widget.skladnik5.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa5, widget.skladnik5)
                            : const SizedBox(),
                        widget.skladnik6.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa6, widget.skladnik6)
                            : const SizedBox(),
                        widget.skladnik7.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa7, widget.skladnik7)
                            : const SizedBox(),
                        widget.skladnik8.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa8, widget.skladnik8)
                            : const SizedBox(),
                        widget.skladnik9.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa9, widget.skladnik9)
                            : const SizedBox(),
                        widget.skladnik10.toString().isNotEmpty
                            ? buildTextEditingControler(
                                gramaturaa10, widget.skladnik10)
                            : const SizedBox(),
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
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/putReceptury"),
        body: jsonEncode({
          "nazwa": widget.nazwa,
          "gramatura1": gramaturaa1.text.toString().isEmpty
              ? widget.gramatura1
              : int.parse(gramaturaa1.text),
          "gramatura2": gramaturaa2.text.toString().isEmpty
              ? widget.gramatura2
              : int.parse(gramaturaa2.text),
          "gramatura3": gramaturaa3.text.toString().isEmpty
              ? widget.gramatura3
              : int.parse(gramaturaa3.text),
          "gramatura4": gramaturaa4.text.toString().isEmpty
              ? widget.gramatura4
              : int.parse(gramaturaa4.text),
          "gramatura5": gramaturaa5.text.toString().isEmpty
              ? widget.gramatura5
              : int.parse(gramaturaa5.text),
          "gramatura6": gramaturaa6.text.toString().isEmpty
              ? widget.gramatura6
              : int.parse(gramaturaa6.text),
          "gramatura7": gramaturaa7.text.toString().isEmpty
              ? widget.gramatura7
              : int.parse(gramaturaa7.text),
          "gramatura8": gramaturaa8.text.toString().isEmpty
              ? widget.gramatura8
              : int.parse(gramaturaa8.text),
          "gramatura9": gramaturaa9.text.toString().isEmpty
              ? widget.gramatura9
              : int.parse(gramaturaa9.text),
          "gramatura10": gramaturaa10.text.toString().isEmpty
              ? widget.gramatura10
              : int.parse(gramaturaa10.text)
        }));
  }

  Future<void> sendDeleteRequest() async {
    await http.put(
        Uri.parse(
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/deteteReceptury"),
        body: jsonEncode({
          "nazwa": widget.nazwa,
        }));
  }

  Widget buildTextEditingControler(
      TextEditingController? textEditingController, String? text) {
    return text != null
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                style: const TextStyle(fontSize: 15.0, color: primaryColor),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: surfaceDarkColor,
                    filled: true,
                    hintStyle: const TextStyle(
                        fontSize: 15.0, color: titleTextDarkColor),
                    hintText: text),
                controller: textEditingController,
              ),
            ),
          )
        : const SizedBox();
  }
}
