import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/invoice_data.dart';
import 'package:invoice_app/invoice_items.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({super.key});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  final TextEditingController invoiceNumber = TextEditingController();
  final TextEditingController invoiceDate = TextEditingController();
  final TextEditingController billToName = TextEditingController();
  final TextEditingController billToAddress = TextEditingController();
  final TextEditingController billToCity = TextEditingController();
  final TextEditingController billToPhone = TextEditingController();
  final TextEditingController fromName = TextEditingController();
  final TextEditingController fromAddress = TextEditingController();
  final TextEditingController fromCity = TextEditingController();
  final TextEditingController fromPhone = TextEditingController();

  String currDate = DateFormat('yMd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    invoiceDate.text = currDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "INVOICE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: invoiceNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "INVOICE NUMBER",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: invoiceDate,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "INVOICE DATE",
                ),
              ),
            ),
            const Text("BILL TO : "),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: billToName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NAME",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: billToAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "STREET ADDRESS",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: billToCity,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CITY/STATE/ZIP",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: billToPhone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PHONE",
                ),
              ),
            ),
            const Text("FROM : "),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: fromName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NAME",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: fromAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "STREET ADDRESS",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: fromCity,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CITY/STATE/ZIP",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: fromPhone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PHONE",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: InkWell(
                onTap: () {
                  InvoiceData invData = InvoiceData(
                    invoiceNumber.text,
                    billToAddress.text,
                    billToCity.text,
                    billToName.text,
                    billToPhone.text,
                    fromAddress.text,
                    fromCity.text,
                    fromName.text,
                    fromPhone.text,
                    invoiceDate.text,
                    [],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvoiceItems(invData: invData)),
                  );
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
