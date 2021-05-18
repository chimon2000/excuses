class Excuse {
  final String? text;
  final int? id;

  Excuse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'];
}
