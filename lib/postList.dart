import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({
    required this.id,
    required this.heartrate,
    required this.oxygen,
    required this.systole,
    required this.diastole,
    required this.body_temp,
    required this.name,
    required this.date,
    required this.time,
    required this.usia,
    required this.jenis_kelamin,
    required this.tinggi_badan,
    required this.berat_badan,
    required this.riwayat_penyakit,
    required this.kamar,
  });

  String id;
  int heartrate;
  int oxygen;
  int systole;
  int diastole;
  double body_temp;
  String name;
  String date;
  String time;
  int usia;
  String jenis_kelamin;
  int tinggi_badan;
  int berat_badan;
  String riwayat_penyakit;
  int kamar;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        heartrate: json["heartrate"],
        oxygen: json["oxygen"],
        systole: json["systole"],
        diastole: json["diastole"],
        body_temp: json["body_temp"],
        name: json["name"],
        date: json["date"],
        time: json["time"],
        usia: json["usia"],
        jenis_kelamin: json["jenis_kelamin"],
        tinggi_badan: json["tinggi_badan"],
        berat_badan: json["berat_badan"],
        riwayat_penyakit: json["riwayat_penyakit"],
        kamar: json["kamar"],
      );
}
