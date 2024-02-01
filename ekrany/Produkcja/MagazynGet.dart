// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigms/screens/Produkcja/MagazynGetView.dart';
import 'package:tigms/screens/Produkcja/RecepturyInstacja.dart';
import 'package:tigms/stale/constants.dart';
import 'package:http/http.dart' as http;

class MagazynGet extends StatefulWidget {
  const MagazynGet({super.key});

  @override
  State<MagazynGet> createState() => _MagazynGetState();
}

class _MagazynGetState extends State<MagazynGet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return Container(
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
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                          color: surfaceDarkColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          "Lista",
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
                        child: FutureBuilder<List<RecepturyInstacja>>(
                            future: recepturyInstacja,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return buildListView(snapshot.data!);
                              }
                              return const SizedBox();
                            }))
                  ]),
                ),
              ),
            ),
          ),
        
        ])));
  }

  Future<List<RecepturyInstacja>> recepturyInstacja =
      pobierzRecepturyInstacja();

  static Future<List<RecepturyInstacja>> pobierzRecepturyInstacja() async {
    final response = await http.get(Uri.parse(
        "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/getMagazyn"));
    final body = jsonDecode(response.body);
    return body.map<RecepturyInstacja>(RecepturyInstacja.fromJson).toList();
  }

  Widget buildListView(List<RecepturyInstacja> recepturyInstacja) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: recepturyInstacja.length,
          itemBuilder: (context, index) {
            final Receptury = recepturyInstacja[index];
            return Container(
              decoration: BoxDecoration(
                  color: surfaceDarkColor,
                  borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  Receptury.nazwa,
                  style: const TextStyle(color: titleTextDarkColor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MagazynGetView(
                                nazwa: Receptury.nazwa,
                                skladnik1: Receptury.skladnik1,
                                gramatura1: Receptury.gramatura1,
                                skladnik2: Receptury.skladnik2,
                                gramatura2: Receptury.gramatura2,
                                skladnik3: Receptury.skladnik3,
                                gramatura3: Receptury.gramatura3,
                                skladnik4: Receptury.skladnik4,
                                gramatura4: Receptury.gramatura4,
                                skladnik5: Receptury.skladnik5,
                                gramatura5: Receptury.gramatura5,
                                skladnik6: Receptury.skladnik6,
                                gramatura6: Receptury.gramatura6,
                                skladnik7: Receptury.skladnik7,
                                gramatura7: Receptury.gramatura7,
                                skladnik8: Receptury.skladnik8,
                                gramatura8: Receptury.gramatura8,
                                skladnik9: Receptury.skladnik9,
                                gramatura9: Receptury.gramatura9,
                                skladnik10: Receptury.skladnik10,
                                gramatura10: Receptury.gramatura10,
                              )));
                },
              ),
            );
          });
}
