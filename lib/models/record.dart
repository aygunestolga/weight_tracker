import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';


@JsonSerializable()
class Record {
  final int weight;
  final DateTime dateTime;
  final String ? note;
  final String ? photoUrl;

  Record({required this.dateTime, required this.weight, this.note, this.photoUrl});

  factory Record.fromJson(Map<String,dynamic>json) => _$RecordFromJson(json);
  Map<String,dynamic> toJson() => _$RecordToJson(this);


}

