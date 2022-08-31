import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:http/http.dart' as http;


class RemoteService
{
  Future<Transaction> fetchTransaction() async
  {
    final response = await http
        .get(Uri.parse('https://www.postman.com/collections/b9bc0bc6089be82c7f3f'));
    if(response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load Transactions');
    }
  }
}