import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class invoiceTile extends StatelessWidget {
  final date;
  final int amount;
  final String currency;
  final String status;
  final String invNumber;
  final String userName;

  const invoiceTile({
    super.key,
    required this.date,
    required this.amount,
    required this.currency,
    required this.status,
    required this.invNumber,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                date.toString(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Text("$currency $amount"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "$userName - #$invNumber",
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: StatusText(status),
            ),
          ],
        )
      ],
    );
  }
}

StatusText(status) {
  Color color = Colors.black;
  switch (status) {
    case "Draft":
      color = Colors.grey;
      break;
    case "Processing":
      color = Colors.cyan;
      break;
    case "Approved":
      color = Colors.green;
      break;
    default:
  }
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      color: color,
    ),
    child: Text("$status"),
  );
}
