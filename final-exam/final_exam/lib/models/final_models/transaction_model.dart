// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import 'package:final_exam/models/final_models/expense_model.dart';

class TransactionModel {
  const TransactionModel({
    required this.expenseCategory,
    required this.expenseDate,
    required this.avatar,
    required this.expenseType,
    required this.expenseValue,
    required this.expensesList,
  });

  final String expenseCategory;
  final Timestamp expenseDate;
  final String avatar;
  final String expenseType;
  final int expenseValue;
  final List<ExpenseModel> expensesList;

  TransactionModel copyWith({
    String? expenseCategory,
    Timestamp? expenseDate,
    String? avatar,
    String? expenseType,
    int? expenseValue,
    List<ExpenseModel>? expensesList,
  }) {
    return TransactionModel(
      expenseCategory: expenseCategory ?? this.expenseCategory,
      expenseDate: expenseDate ?? this.expenseDate,
      avatar: avatar ?? this.avatar,
      expenseType: expenseType ?? this.expenseType,
      expenseValue: expenseValue ?? this.expenseValue,
      expensesList: expensesList ?? this.expensesList,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'expenseCategory': expenseCategory,
  //     'expenseDate': expenseDate.toMap(),
  //     'avatar': avatar,
  //     'expenseType': expenseType,
  //     'expenseValue': expenseValue,
  //     'expensesList': expensesList.map((x) => x.toMap()).toList(),
  //   };
  // }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      expenseCategory: map['expenseCategory'] as String,
      expenseDate: map['expenseDate'],
      avatar: map['avatar'] as String,
      expenseType: map['expenseType'] as String,
      expenseValue: map['expenseValue'] as int,
      expensesList: List<ExpenseModel>.from(
        (map['expensesList']).map<ExpenseModel>(
          (x) => ExpenseModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(expenseCategory: $expenseCategory, expenseDate: $expenseDate, avatar: $avatar, expenseType: $expenseType, expenseValue: $expenseValue, expensesList: $expensesList)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.expenseCategory == expenseCategory &&
        other.expenseDate == expenseDate &&
        other.avatar == avatar &&
        other.expenseType == expenseType &&
        other.expenseValue == expenseValue &&
        listEquals(other.expensesList, expensesList);
  }

  @override
  int get hashCode {
    return expenseCategory.hashCode ^
        expenseDate.hashCode ^
        avatar.hashCode ^
        expenseType.hashCode ^
        expenseValue.hashCode ^
        expensesList.hashCode;
  }
}
