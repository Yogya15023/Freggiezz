import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact-us!'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.email),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text('E-mail us at'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text('freggiezzbokaro@gmail.com'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.call),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('call us'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('9341946245'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
