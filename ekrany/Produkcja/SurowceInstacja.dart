// ignore_for_file: file_names

class SurowceInstacja {
  final String? id;
  final String nazwa;
  final int gramatura;

  const SurowceInstacja({
    required this.id,
    required this.nazwa,
    required this.gramatura,
  });

  static SurowceInstacja fromJson(json) => SurowceInstacja(
      id: json['_id'], nazwa: json['nazwa'], gramatura: json['gramatura']);
}
