import 'package:iti_actors/local_storage/db_helper.dart';

class ActorDetail {
  final String name;
  final String profilePath;
  final String department;
  final double popularity;
  final int id;
  final String biography;
  final String birthDate;
  final String birthPlace;
  final List imagesProfiles;
  List offlineImages;

  ActorDetail(
      {this.name,
      this.profilePath,
      this.department,
      this.popularity,
      this.id,
      this.biography,
      this.birthDate,
      this.birthPlace,
      this.imagesProfiles,
      this.offlineImages});

  factory ActorDetail.fromJson(Map<String, dynamic> json) {
    return ActorDetail(
        name: json['name'],
        profilePath: json['profile_path'],
        department: json['known_for_department'],
        popularity: json['popularity'].toDouble(),
        id: json['id'],
        biography: json['biography'],
        birthDate: json['birthday'],
        birthPlace: json['place_of_birth'],
        imagesProfiles: json['images']['profiles']);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_ID: id,
      DbHelper.COLUMN_NAME: name,
      DbHelper.COLUMN_BIRTHDAY: birthDate,
      DbHelper.COLUMN_BIRTHPLACE: birthPlace,
      DbHelper.COLUMN_BIOGRAPHY: biography,
      DbHelper.COLUMN_IMG: profilePath,
      DbHelper.COLUMN_POPULARITY: popularity,
      DbHelper.COLUMN_DEPARTMENT: department
    };
  }

  factory ActorDetail.fromDatabase(Map<String, dynamic> json) => ActorDetail(
      id: json[DbHelper.COLUMN_ID],
      name: json[DbHelper.COLUMN_NAME],
      birthDate: json[DbHelper.COLUMN_BIRTHDAY],
      birthPlace: json[DbHelper.COLUMN_BIRTHPLACE],
      biography: json[DbHelper.COLUMN_BIOGRAPHY],
      profilePath: json[DbHelper.COLUMN_IMG],
      popularity: json[DbHelper.COLUMN_POPULARITY],
      department: json[DbHelper.COLUMN_DEPARTMENT]);
}
