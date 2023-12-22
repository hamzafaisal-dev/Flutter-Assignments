// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  const ExpenseModel({
    required this.transactionDay,
    required this.transactionDate,
    required this.totalExpense,
  });

  final String transactionDay;
  final Timestamp transactionDate;
  final int totalExpense;

  ExpenseModel copyWith({
    String? transactionDay,
    Timestamp? transactionDate,
    int? totalExpense,
  }) {
    return ExpenseModel(
      transactionDay: transactionDay ?? this.transactionDay,
      transactionDate: transactionDate ?? this.transactionDate,
      totalExpense: totalExpense ?? this.totalExpense,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'transactionDay': transactionDay,
  //     'transactionDate': transactionDate.toMap(),
  //     'totalExpense': totalExpense,
  //   };
  // }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      transactionDay: map['transactionDay'] as String,
      transactionDate: map['transactionDate'],
      totalExpense: map['totalExpense'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ExpenseModel(transactionDay: $transactionDay, transactionDate: $transactionDate, totalExpense: $totalExpense)';

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;

    return other.transactionDay == transactionDay &&
        other.transactionDate == transactionDate &&
        other.totalExpense == totalExpense;
  }

  @override
  int get hashCode =>
      transactionDay.hashCode ^
      transactionDate.hashCode ^
      totalExpense.hashCode;
}
