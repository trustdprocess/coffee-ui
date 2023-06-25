import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  Future<Map<String, dynamic>> readJson() async {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return throw Exception("Failed!");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, data) {
        if (data.hasError) {
          return Text("Error!");
        } else if (data.hasData) {
          final listViewer = data.data?['data'];
          return ListView.builder(
            itemCount: listViewer?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Image.network(listViewer[index]['avatar']),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
