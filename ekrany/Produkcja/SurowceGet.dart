// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigms/screens/Produkcja/SurowcePost.dart';
import 'package:tigms/screens/Produkcja/SurowceInstacja.dart';
import 'package:tigms/screens/Produkcja/SurowcePut.dart';
import 'package:tigms/stale/constants.dart';
import 'package:http/http.dart' as http;

class SurowceGet extends StatefulWidget {
  const SurowceGet({super.key});

  @override
  State<SurowceGet> createState() => _SurowceGetState();
}

class _SurowceGetState extends State<SurowceGet> {
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
                child: Container(
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
                        child: FutureBuilder<List<SurowceInstacja>>(
                            future: surowceInstacja,
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
          Container(
            height: 50,
            width: 200,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SurowcePost()));
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: titleTextDarkColor,
                    )),
              ],
            ),
          )
        ])));
  }

  Future<List<SurowceInstacja>> surowceInstacja = pobierzSurowceInstacja();

  static Future<List<SurowceInstacja>> pobierzSurowceInstacja() async {
    final response = await http.get(Uri.parse(
        "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/getSurowce"));
    final body = jsonDecode(response.body);
    return body.map<SurowceInstacja>(SurowceInstacja.fromJson).toList();
  }

  Widget buildListView(List<SurowceInstacja> surowceInstacja) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: surowceInstacja.length,
          itemBuilder: (context, index) {
            final Surowce = surowceInstacja[index];
            return Container(
              decoration: BoxDecoration(
                  color: surfaceDarkColor,
                  borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  Surowce.nazwa,
                  style: const TextStyle(color: titleTextDarkColor),
                ),
                subtitle: Text(
                  "${Surowce.gramatura} g",
                  style: const TextStyle(color: bodyTextColorDark),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SurowcePut(
                                nazwa: Surowce.nazwa,
                              )));
                },
              ),
            );
          });
}
