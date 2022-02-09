import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? fromValue = "INR";
  String? toValue = "USD";
  TextEditingController value = TextEditingController();
  double result = 0;

  convert() async {
    http.Response response = await http.get(Uri.parse("https://freecurrencyapi.net/api/v2/latest?apikey=77ea0650-89d7-11ec-8258-ff76fc11648c&base_currency=$fromValue"));
    var jsonData = jsonDecode(response.body);
    result = (double.parse(value.text) * jsonData["data"][toValue]) as double;
    setState(() {});
  }

  List currencies = [
    "USD",
    "CNY",
    "JPY",
    "CHF",
    "CAD",
    "MXN",
    "INR",
    "BRL",
    "RUB",
    "KRW",
    "IDR",
    "TRY",
    "SAR",
    "SEK",
    "NGN",
    "PLN",
    "ARS",
    "NOK",
    "TWD",
    "IRR",
    "AED",
    "COP",
    "THB",
    "ZAR",
    "DKK",
    "MYR",
    "SGD",
    "ILS",
    "HKD",
    "EGP",
    "PHP",
    "CLP",
    "PKR",
    "IQD",
    "DZD",
    "KZT",
    "QAR",
    "CZK",
    "PEN",
    "RON",
    "VND",
    "BDT",
    "HUF",
    "UAH",
    "AOA",
    "MAD",
    "OMR",
    "CUC",
    "BYR",
    "AZN",
    "LKR",
    "SDG",
    "SYP",
    "MMK",
    "DOP",
    "UZS",
    "KES",
    "GTQ",
    "URY",
    "HRV",
    "MOP",
    "ETB",
    "CRC",
    "TZS",
    "TMT",
    "TND",
    "PAB",
    "LBP",
    "RSD",
    "LYD",
    "GHS",
    "YER",
    "BOB",
    "BHD",
    "CDF",
    "PYG",
    "UGX",
    "SVC",
    "TTD",
    "AFN",
    "NPR",
    "HNL",
    "BIH",
    "BND",
    "ISK",
    "KHR",
    "GEL",
    "MZN",
    "BWP",
    "PGK",
    "JMD",
    "XAF",
    "NAD",
    "ALL",
    "SSP",
    "MUR",
    "MNT",
    "NIO",
    "LAK",
    "MKD",
    "AMD",
    "MGA",
    "XPF",
    "TJS",
    "HTG",
    "BSD",
    "MDL",
    "RWF",
    "KGS",
    "GNF",
    "SRD",
    "SLL",
    "XOF",
    "MWK",
    "FJD",
    "ERN",
    "SZL",
    "GYD",
    "BIF",
    "KYD",
    "MVR",
    "LSL",
    "LRD",
    "CVE",
    "DJF",
    "SCR",
    "SOS",
    "GMD",
    "KMF",
    "STD",
    "BTC",
    "XRP",
    "AUD",
    "BGN",
    "JOD",
    "GBP",
    "ETH",
    "EUR",
    "LTC",
    "NZD"
  ];

  Iterable<DropdownMenuItem<Object>>? finalList;
  getCurrencies() {
    finalList = currencies.map((item) => DropdownMenuItem(
          child: Text(item),
          value: item,
        ));
  }

  @override
  void initState() {
    getCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton(
                    value: fromValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (item) {
                      setState(() {
                        fromValue = item.toString();
                        result = 0;
                        value.clear();
                      });
                    },
                    items: finalList!.toList()),
                const SizedBox(width: 6),
                const Text(" To "),
                const SizedBox(width: 6),
                DropdownButton(
                    value: toValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (item) {
                      setState(() {
                        toValue = item.toString();
                        result = 0;
                        value.clear();
                      });
                    },
                    items: finalList!.toList()),
              ],
            ),
            TextField(
              controller: value,
            ),
            ElevatedButton(onPressed: () => convert(), child: Text("Convert")),
            Text("${value.text} $fromValue is equals to ${result.toStringAsFixed(2)} $toValue")
          ],
        ),
      ),
    );
  }
}
