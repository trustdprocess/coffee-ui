import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:new_app37/models.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Future<List<models>> readJson() async {
    final json = await rootBundle.rootBundle.loadString("assets/file.json");
    final decode = jsonDecode(json) as List<dynamic>;
    return decode.map((e) => models.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJson(),
        builder: (context, data) {
          if (data.hasError) {
            return Text("Error!");
          } else if (data.hasData) {
            var items = data.data as List<models>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    leading: Container(child: Image.network(items[index].image.toString(),fit: BoxFit.fill,)),
                    title: Text(items[index].name.toString()),
                    subtitle: Text(items[index].description.toString()),
                    trailing: Text(items[index].price.toString()),
                
                  ),
                  
                );

              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        
      ),
      
    );
  }
}
