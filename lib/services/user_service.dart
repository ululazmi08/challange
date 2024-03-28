import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pegawai/services/end_point.dart';

class UserService {
  static Future listUser() async {
    print('Detail Question Service');
    var response =
        await http.get(Uri.parse('$baseUrl/accurate/user'), headers: {
      'Accept': '*/*',
      'Content-Type': 'application/json',
    });

    debugPrint("Detail Quest RES : " + response.body);
    if (response.statusCode != 200) return json.decode(response.body);
    return json.decode(response.body);
  }

  static Future listCity() async {
    print('City Service');
    var response =
        await http.get(Uri.parse('$baseUrl/accurate/city'), headers: {
      'Accept': '*/*',
      'Content-Type': 'application/json',
    });

    debugPrint("List City RES : " + response.body);
    if (response.statusCode != 200) return json.decode(response.body);
    return json.decode(response.body);
  }

  static Future addUser(String name, String address, String email, String phoneNumber, String city) async {
    print('Add USER Service');
    var response =
        await http.post(Uri.parse('$baseUrl/accurate/user'), headers: {
      'Accept': '*/*',
      'Content-Type': 'application/json',
    }, body: jsonEncode({
          'name': name,
          'address': address,
          'email': email,
          'phoneNumber': phoneNumber,
          'city': city,
        }));

    debugPrint("Add User RES : " + response.body);
    if (response.statusCode != 200) return json.decode(response.body);
    return json.decode(response.body);
  }
}
