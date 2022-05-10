import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Address with ChangeNotifier {
  final String name;
  final String address;
  final int zipcode;
  final int mob;

  Address({
    @required this.name,
    @required this.address,
    @required this.zipcode,
    @required this.mob,
  });
}
