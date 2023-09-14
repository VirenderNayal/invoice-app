import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app/invoice_items.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({super.key});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  final TextEditingController _controller = new TextEditingController();

  String currDate = DateFormat('yMd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _controller.text = currDate;
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "INVOICE NUMBER",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "INVOICE DATE",
                ),
              ),
            ),
            const Text("BILL TO : "),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NAME",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "STREET ADDRESS",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CITY/STATE/ZIP",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PHONE",
                ),
              ),
            ),
            const Text("FROM : "),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NAME",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "STREET ADDRESS",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CITY/STATE/ZIP",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PHONE",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InvoiceItems()),
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
