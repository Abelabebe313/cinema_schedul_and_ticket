import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChappaPayment {
  Future<void> pay(BuildContext context) async {
    var headers = {
      'Authorization': 'Bearer CHASECK_TEST-dr287iJp6CxPYu5SsRDYP7toefyBPdGY',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://api.chapa.co/v1/transaction/initialize'));
    request.body = json.encode({
      "amount": "100",
      "currency": "ETB",
      "email": "abebech_bekele@gmail.com",
      "first_name": "Bilen",
      "last_name": "Gizachew",
      "phone_number": "0912345678",
      "tx_ref": "chewatatest-6660",
      "callback_url":
          "https://webhook.site/077164d6-29cb-40df-ba29-8a00e59a7e60",
      "return_url": "https://www.google.com/",
      "customization[title]": "Payment for my favourite merchant",
      "customization[description]": "I love online payments"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print("==========");
      print(response.reasonPhrase);
    }
  }
}
