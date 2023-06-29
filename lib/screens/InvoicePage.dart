import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_code/models/invoice_model.dart';
import 'package:live_code/screens/invoice_tile.dart';
import 'dart:convert';

class InvoiceList extends StatefulWidget {
  const InvoiceList({super.key});

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  late List<Invoice> invoices;
  @override
  void initState() {
    invoices = [Invoice()];
    super.initState();
    (() async {
      invoices = await readJson();
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 60.0, 8.0, 8.0),
          child: const Text("Invoices"),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              invoiceTile(
                amount: invoices[0].amount ?? 0,
                currency: invoices[0].currency.toString() ?? "",
                date: invoices[0].submittedDate ?? "",
                invNumber: invoices[0].invoiceNumber ?? "",
                status: invoices[0].status.toString() ?? "",
                userName: invoices[0].submittedByUserId ?? "",
              ),
            ],
          ),
        )
      ]),
    );
  }
}

Future<List<Invoice>> readJson() async {
  final String response = await rootBundle.loadString('Data/invoices.json');
  final List<Invoice> data = invoiceFromJson(response);
  return data;
}
