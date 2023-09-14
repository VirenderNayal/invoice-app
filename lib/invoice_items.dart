import 'package:flutter/material.dart';

class InvoiceItems extends StatelessWidget {
  const InvoiceItems({super.key});

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
          "INVOICE ITEMS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => Dialog(
                    child: Container(
                      height: 325,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("ITEM DETAILS"),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "DESCRIPTION",
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "AMOUNT",
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Save"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "ADD ITEM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
