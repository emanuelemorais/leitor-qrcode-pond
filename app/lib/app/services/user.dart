import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

Future<void> createUser(String email, String name, String password) async {
  const url = "http://10.0.2.2/api/v1/user";
  print("Email: $email, Name: $name, Password: $password");

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'email': email,
      'name': name,
      'password': password,
    }),
    );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
    throw Exception("Erro ao solicitar dados da API.");
  }
}

Future<void> loginUser(BuildContext context, String email, String password) async {
  const url = "http://10.0.2.2/api/v1/login";

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
    );

  if (response.statusCode == 200) {
    print(response.body);
    Navigator.pushNamed(context, "/camera");
  } else {
    print(response.body);
    throw Exception("Erro ao solicitar dados da API.");
  }
}


