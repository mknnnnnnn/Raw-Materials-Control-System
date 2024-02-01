// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tigms/stale/constants.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ZleceniaPost extends StatefulWidget {
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
  const ZleceniaPost(
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
  State<ZleceniaPost> createState() => _ZleceniaPostState();
}

class _ZleceniaPostState extends State<ZleceniaPost> {
  String weightRemoteID = 'D5522E08-AAA5-292F-1ADF-6207EF692C2A';
  String weightServiceID = 'FFF0';
  String weightCharacterisicsID = 'FFF1';
  List<int> weightReceivedValue = [];
  List<String> weight = ['', '', '', '', '', '', '', '', '', ''];

  @override
  void initState() {
    _startScanning();
    _listenScanResult();
    _listenScanResult();
    super.initState();
  }

  Widget buildListTile(String? skladnik, int? gramatura, String gramaturaWaga) {
    return skladnik != null && gramatura != null
        ? Row(
            children: [
              Container(
                width: 200,
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
              ),
              Container(
                  width: 100,
                  height: 65,
                  decoration: BoxDecoration(
                      color: surfaceDarkColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    gramaturaWaga,
                    style: const TextStyle(color: bodyTextColorDark),
                  ))),
            ],
          )
        : const SizedBox();
  }

  void _startScanning() async {
    await FlutterBluePlus.adapterState
        .where((state) => state == BluetoothAdapterState.on)
        .first;
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 1));
  }

  void _listenScanResult() async {
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color: false);
    FlutterBluePlus.scanResults.listen((scanList) async {
      for (ScanResult result in scanList) {
        if (result.device.remoteId.toString() == weightRemoteID) {
          result.device.connect(autoConnect: true);
          List<BluetoothService> services =
              await result.device.discoverServices();
          services.forEach((service) async {
            var characteristics = service.characteristics;
            for (BluetoothCharacteristic c in characteristics) {
              await c.setNotifyValue(true);
              weightReceivedValue = c.lastValue;
              setState(() {});
            }
          });
        }
      }
    });
  }

  double getWeight(List<int> weightReceivedValue) {
    int firstVal = weightReceivedValue.elementAt(9);
    int secondVal = weightReceivedValue.elementAt(10);
    int flag = weightReceivedValue.elementAt(11);
    String hexVal = '';
    final firstHexVal = firstVal.toRadixString(16);
    final secondHexVal = secondVal.toRadixString(16);
    hexVal = firstHexVal + secondHexVal;
    int finalValue = int.parse(hexVal, radix: 16);
    finalValue.round();
    if (flag == 126) {
      return (finalValue / 10).roundToDouble();
    } else {
      return finalValue / 1;
    }
  }

  Future<void> sendPostRequest() async {
    await http.post(
        Uri.parse(
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/postZlecenia"),
        body: jsonEncode({
          "nazwa":
              widget.nazwa.toString().isEmpty ? "" : widget.nazwa.toString(),
          "skladnik1": widget.skladnik1.toString().isEmpty
              ? ""
              : widget.skladnik1.toString(),
          "gramatura1":
              weight[0].toString().isEmpty ? null : double.parse(weight[0]),
          "skladnik2": widget.skladnik2.toString().isEmpty
              ? ""
              : widget.skladnik2.toString(),
          "gramatura2":
              weight[1].toString().isEmpty ? null : double.parse(weight[1]),
          "skladnik3": widget.skladnik3.toString().isEmpty
              ? ""
              : widget.skladnik3.toString(),
          "gramatura3":
              weight[2].toString().isEmpty ? null : double.parse(weight[2]),
          "skladnik4": widget.skladnik4.toString().isEmpty
              ? ""
              : widget.skladnik4.toString(),
          "gramatura4":
              weight[3].toString().isEmpty ? null : double.parse(weight[3]),
          "skladnik5": widget.skladnik5.toString().isEmpty
              ? ""
              : widget.skladnik5.toString(),
          "gramatura5":
              weight[4].toString().isEmpty ? null : double.parse(weight[4]),
          "skladnik6": widget.skladnik6.toString().isEmpty
              ? ""
              : widget.skladnik6.toString(),
          "gramatura6":
              weight[5].toString().isEmpty ? null : double.parse(weight[5]),
          "skladnik7": widget.skladnik7.toString().isEmpty
              ? ""
              : widget.skladnik7.toString(),
          "gramatura7":
              weight[6].toString().isEmpty ? null : double.parse(weight[6]),
          "skladnik8": widget.skladnik8.toString().isEmpty
              ? ""
              : widget.skladnik8.toString(),
          "gramatura8":
              weight[7].toString().isEmpty ? null : double.parse(weight[7]),
          "skladnik9": widget.skladnik9.toString().isEmpty
              ? ""
              : widget.skladnik9.toString(),
          "gramatura9":
              weight[8].toString().isEmpty ? null : double.parse(weight[8]),
          "skladnik10": widget.skladnik10.toString().isEmpty
              ? ""
              : widget.skladnik10.toString(),
          "gramatura10":
              weight[9].toString().isEmpty ? null : double.parse(weight[9]),
        }));
  }

Future<void> sendUpdateRequest() async {
    await http.post(
        Uri.parse(
            "https://us-east-1.aws.data.mongodb-api.com/app/tigms-loucm/endpoint/newSurowce"),
        body: jsonEncode({
          "skladnik1": widget.skladnik1.toString().isEmpty
              ? ""
              : widget.skladnik1.toString(),
          "gramatura1":
              weight[0].toString().isEmpty ? null : double.parse(weight[0]),
          "skladnik2": widget.skladnik2.toString().isEmpty
              ? ""
              : widget.skladnik2.toString(),
          "gramatura2":
              weight[1].toString().isEmpty ? null : double.parse(weight[1]),
          "skladnik3": widget.skladnik3.toString().isEmpty
              ? ""
              : widget.skladnik3.toString(),
          "gramatura3":
              weight[2].toString().isEmpty ? null : double.parse(weight[2]),
          "skladnik4": widget.skladnik4.toString().isEmpty
              ? ""
              : widget.skladnik4.toString(),
          "gramatura4":
              weight[3].toString().isEmpty ? null : double.parse(weight[3]),
          "skladnik5": widget.skladnik5.toString().isEmpty
              ? ""
              : widget.skladnik5.toString(),
          "gramatura5":
              weight[4].toString().isEmpty ? null : double.parse(weight[4]),
          "skladnik6": widget.skladnik6.toString().isEmpty
              ? ""
              : widget.skladnik6.toString(),
          "gramatura6":
              weight[5].toString().isEmpty ? null : double.parse(weight[5]),
          "skladnik7": widget.skladnik7.toString().isEmpty
              ? ""
              : widget.skladnik7.toString(),
          "gramatura7":
              weight[6].toString().isEmpty ? null : double.parse(weight[6]),
          "skladnik8": widget.skladnik8.toString().isEmpty
              ? ""
              : widget.skladnik8.toString(),
          "gramatura8":
              weight[7].toString().isEmpty ? null : double.parse(weight[7]),
          "skladnik9": widget.skladnik9.toString().isEmpty
              ? ""
              : widget.skladnik9.toString(),
          "gramatura9":
              weight[8].toString().isEmpty ? null : double.parse(weight[8]),
          "skladnik10": widget.skladnik10.toString().isEmpty
              ? ""
              : widget.skladnik10.toString(),
          "gramatura10":
              weight[9].toString().isEmpty ? null : double.parse(weight[9]),
        }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Produkuj",
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
                      Column(
                        children: [
                          Container(
                              height: 350,
                              width: 500,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: ListView(
                                children: [
                                  widget.skladnik1 != null &&
                                          widget.gramatura1 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[0] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik1,
                                      widget.gramatura1, weight[0]),
                                  widget.skladnik2 != null &&
                                          widget.gramatura2 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[1] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik2,
                                      widget.gramatura2, weight[1]),
                                  widget.skladnik3 != null &&
                                          widget.gramatura3 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[2] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik3,
                                      widget.gramatura3, weight[2]),
                                  widget.skladnik4 != null &&
                                          widget.gramatura4 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[3] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik4,
                                      widget.gramatura4, weight[3]),
                                  widget.skladnik5 != null &&
                                          widget.gramatura5 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[4] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik5,
                                      widget.gramatura5, weight[4]),
                                  widget.skladnik6 != null &&
                                          widget.gramatura6 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[5] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik6,
                                      widget.gramatura6, weight[5]),
                                  widget.skladnik7 != null &&
                                          widget.gramatura7 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[6] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik7,
                                      widget.gramatura7, weight[6]),
                                  widget.skladnik8 != null &&
                                          widget.gramatura8 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[7] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik8,
                                      widget.gramatura8, weight[7]),
                                  widget.skladnik9 != null &&
                                          widget.gramatura9 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[8] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : const SizedBox(),
                                  buildListTile(widget.skladnik9,
                                      widget.gramatura9, weight[8]),
                                  widget.skladnik10 != null &&
                                          widget.gramatura10 != null
                                      ? IconButton(
                                          onPressed: () {
                                            _listenScanResult();
                                            setState(() {
                                              weight[9] =
                                                  getWeight(weightReceivedValue)
                                                      .toString();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: titleTextDarkColor,
                                          ))
                                      : SizedBox(),
                                  buildListTile(widget.skladnik10,
                                      widget.gramatura10, weight[9]),
                                ],
                              )),
                          const SizedBox(height: 20),
                          IconButton(
                              onPressed: () {
                                sendPostRequest();
                                sendUpdateRequest();
                              },
                              icon: const Icon(
                                Icons.send_outlined,
                                color: titleTextDarkColor,
                              ))
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ]))),
    );
  }
}
