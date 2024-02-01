// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigms/stale/constants.dart';

class RecepturyGetView extends StatefulWidget {
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
  const RecepturyGetView(
      {super.key,
      this.id,
      this.nazwa,
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
  State<RecepturyGetView> createState() => _RecepturyGetViewState();
}

class _RecepturyGetViewState extends State<RecepturyGetView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Receptura",
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
              child: Column(children: [
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 375,
                    height: 200,
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height: 25,
                        decoration: BoxDecoration(
                            color: surfaceDarkColor,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(
                          child: Text(
                            widget.nazwa,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 15.0, color: titleTextDarkColor)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 350,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: ListView(
                            children: [
                              buildListTile(widget.skladnik1, widget.gramatura1),
                              buildListTile(widget.skladnik2, widget.gramatura2),
                              buildListTile(widget.skladnik3, widget.gramatura3),
                              buildListTile(widget.skladnik4, widget.gramatura4),
                              buildListTile(widget.skladnik5, widget.gramatura5),
                              buildListTile(widget.skladnik6, widget.gramatura6),
                              buildListTile(widget.skladnik7, widget.gramatura7),
                              buildListTile(widget.skladnik8, widget.gramatura8),
                              buildListTile(widget.skladnik9, widget.gramatura9),
                              buildListTile(widget.skladnik10, widget.gramatura10),
                            ],
                          )),
                    ]),
                  ),
                ),
              ),
            ),
          ]))),
    );
  }

  Widget buildListTile(String? skladnik, int? gramatura) {
    return skladnik != null && gramatura != null
        ? Container(
            decoration: BoxDecoration(
                color: surfaceDarkColor,
                borderRadius: BorderRadius.circular(15.0)),
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                skladnik,
                style: const TextStyle(color: titleTextDarkColor),
              ),
              subtitle: Text(
                "$gramatura g",
                style: const TextStyle(color: bodyTextColorDark),
              ),
            ),
          )
        : const SizedBox();
  }
}
