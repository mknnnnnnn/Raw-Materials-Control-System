// ignore_for_file: file_names

class RecepturyInstacja {
  final String? id;
  final String nazwa;
  final String? skladnik1;
  final int? gramatura1;
  final String? skladnik2;
  final int? gramatura2;
  final String? skladnik3;
  final int? gramatura3;
  final String? skladnik4;
  final int? gramatura4;
  final String? skladnik5;
  final int? gramatura5;
  final String? skladnik6;
  final int? gramatura6;
  final String? skladnik7;
  final int? gramatura7;
  final String? skladnik8;
  final int? gramatura8;
  final String? skladnik9;
  final int? gramatura9;
  final String? skladnik10;
  final int? gramatura10;

  const RecepturyInstacja
({
    required this.id,
    required this.nazwa,
    required this.skladnik1,
    required this.gramatura1,
    required this.skladnik2,
    required this.gramatura2,
    required this.skladnik3,
    required this.gramatura3,
    required this.skladnik4,
    required this.gramatura4,
    required this.skladnik5,
    required this.gramatura5,
    required this.skladnik6,
    required this.gramatura6,
    required this.skladnik7,
    required this.gramatura7,
    required this.skladnik8,
    required this.gramatura8,
    required this.skladnik9,
    required this.gramatura9,
    required this.skladnik10,
    required this.gramatura10,
  });

  static RecepturyInstacja
 fromJson(json) => RecepturyInstacja
(
      id: json['_id'], nazwa: json['nazwa'], 
      skladnik1: json['skladnik1'],
      gramatura1: json['gramatura1'],
      skladnik2: json['skladnik2'],
      gramatura2: json['gramatura2'],
      skladnik3: json['skladnik3'],
      gramatura3: json['gramatura3'],
      skladnik4: json['skladnik4'],
      gramatura4: json['gramatura4'],
      skladnik5: json['skladnik5'],
      gramatura5: json['gramatura5'],
      skladnik6: json['skladnik6'],
      gramatura6: json['gramatura6'],
      skladnik7: json['skladnik7'],
      gramatura7: json['gramatura7'],
      skladnik8: json['skladnik8'],
      gramatura8: json['gramatura8'],
      skladnik9: json['skladnik9'],
      gramatura9: json['gramatura9'],
      skladnik10: json['skladnik10'],
      gramatura10: json['gramatura10'],
      
      
      );
}
