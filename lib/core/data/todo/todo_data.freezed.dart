// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoData _$TodoDataFromJson(Map<String, dynamic> json) {
  return _TodoData.fromJson(json);
}

/// @nodoc
mixin _$TodoData {
  String? get title => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoDataCopyWith<TodoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoDataCopyWith<$Res> {
  factory $TodoDataCopyWith(TodoData value, $Res Function(TodoData) then) =
      _$TodoDataCopyWithImpl<$Res, TodoData>;
  @useResult
  $Res call(
      {String? title,
      String? id,
      String? uid,
      String? date,
      String? time,
      String? category,
      String? note});
}

/// @nodoc
class _$TodoDataCopyWithImpl<$Res, $Val extends TodoData>
    implements $TodoDataCopyWith<$Res> {
  _$TodoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? uid = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? category = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoDataCopyWith<$Res> implements $TodoDataCopyWith<$Res> {
  factory _$$_TodoDataCopyWith(
          _$_TodoData value, $Res Function(_$_TodoData) then) =
      __$$_TodoDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? id,
      String? uid,
      String? date,
      String? time,
      String? category,
      String? note});
}

/// @nodoc
class __$$_TodoDataCopyWithImpl<$Res>
    extends _$TodoDataCopyWithImpl<$Res, _$_TodoData>
    implements _$$_TodoDataCopyWith<$Res> {
  __$$_TodoDataCopyWithImpl(
      _$_TodoData _value, $Res Function(_$_TodoData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? uid = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? category = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_TodoData(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoData implements _TodoData {
  const _$_TodoData(
      {this.title,
      this.id,
      this.uid,
      this.date,
      this.time,
      this.category,
      this.note});

  factory _$_TodoData.fromJson(Map<String, dynamic> json) =>
      _$$_TodoDataFromJson(json);

  @override
  final String? title;
  @override
  final String? id;
  @override
  final String? uid;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? category;
  @override
  final String? note;

  @override
  String toString() {
    return 'TodoData(title: $title, id: $id, uid: $uid, date: $date, time: $time, category: $category, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, id, uid, date, time, category, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoDataCopyWith<_$_TodoData> get copyWith =>
      __$$_TodoDataCopyWithImpl<_$_TodoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoDataToJson(
      this,
    );
  }
}

abstract class _TodoData implements TodoData {
  const factory _TodoData(
      {final String? title,
      final String? id,
      final String? uid,
      final String? date,
      final String? time,
      final String? category,
      final String? note}) = _$_TodoData;

  factory _TodoData.fromJson(Map<String, dynamic> json) = _$_TodoData.fromJson;

  @override
  String? get title;
  @override
  String? get id;
  @override
  String? get uid;
  @override
  String? get date;
  @override
  String? get time;
  @override
  String? get category;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_TodoDataCopyWith<_$_TodoData> get copyWith =>
      throw _privateConstructorUsedError;
}
