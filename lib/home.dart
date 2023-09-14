import 'package:flutter/material.dart';
import 'package:invoice_app/auth.dart';
import 'package:invoice_app/invoice_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 90,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
              maxRadius: 25,
            ),
            SizedBox(width: 10),
            Text(
              "Username",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InvoiceDetails()),
                  );
                }, //goto page
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Center(
                    child: Text(
                      "Create Invoice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {}, //goto page
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Center(
                    child: Text(
                      "List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: InkWell(
                onTap: () {
                  Auth().signOut();
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
                    "Log Out",
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
