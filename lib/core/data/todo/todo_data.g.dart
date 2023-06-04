// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoData _$$_TodoDataFromJson(Map<String, dynamic> json) => _$_TodoData(
      title: json['title'] as String?,
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      category: json['category'] as String?,
      note: json['note'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoDataToJson(_$_TodoData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'uid': instance.uid,
      'date': instance.date,
      'time': instance.time,
      'category': instance.category,
      'note': instance.note,
      'status': instance.status,
    };
