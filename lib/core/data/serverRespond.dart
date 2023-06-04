import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
@immutable
class ServerResponse extends Equatable {
  final Object? payload;
  final String? defaultMessage;
  final String errorMessage;
  final bool isSuccess;
  final int statusCode;

  const ServerResponse(this.payload, this.defaultMessage, this.isSuccess,
      this.statusCode, this.errorMessage);

  static ServerResponse fromJson(
    Map<String, dynamic> json,
  ) {
    return ServerResponse(json, json["message"], json['success'],
        json['statusCode'], json['error'] ?? "Please try again");
  }

  @override
  List<Object?> get props => [defaultMessage, payload];
}
