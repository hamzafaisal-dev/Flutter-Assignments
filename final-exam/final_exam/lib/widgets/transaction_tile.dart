import 'package:final_exam/models/final_models/expense_model.dart';
import 'package:final_exam/models/final_models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.expense});

  final TransactionModel expense;

// import 'package:intl/intl.dart';

// String convertTimestamp(int timestamp) {
//   // Create a DateTime object from the timestamp
//   DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

//   // Create a DateFormat object with the desired format
//   DateFormat formatter = DateFormat('yyyy-MM-dd');

//   // Format the date using the formatter and return the result
//   return formatter.format(date);
// }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        tileColor: Colors.white,

        contentPadding: const EdgeInsets.only(left: 0),

        // icon / picture
        leading: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: const Icon(
                Icons.badge,
                color: Color.fromARGB(255, 3, 81, 145),
                size: 35,
              ),
            ),
          ],
        ),

        // title
        title: Text(
          expense.expenseCategory,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        //subtitle
        subtitle: Text(
          expense.expenseDate.toString(),
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),

        trailing: Container(
          // height: 55,
          // width: 55,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Text(
            '+ \$${expense.expenseValue}',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
