import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_data.freezed.dart';
part 'todo_data.g.dart';


@freezed
class TodoData with _$TodoData {
  const factory TodoData({
    String? title,
    String? id,
    String? uid,
    String? date,
    String? time,
    String? category,
    String? note

  }) = _TodoData;

  factory TodoData.fromJson(Map<String, dynamic> json) => _$TodoDataFromJson(json);
}





