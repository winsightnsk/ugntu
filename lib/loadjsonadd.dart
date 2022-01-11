import 'dart:convert';
import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'class_users.dart';
import 'cnstnts.dart';

class LoadJSONadd extends StatefulWidget {
  static String rote = 'LoadJSONadd';
  final User user;
  const LoadJSONadd(this.user, {Key? key}) : super(key: key);

  @override
  _LoadJSONaddState createState() => _LoadJSONaddState();
}

class _LoadJSONaddState extends State<LoadJSONadd> {
  Future<List<Zzz>> fetchTodos() async {
    var response = await http.get(
        Uri.parse(urlGetZzzList + widget.user.id.toString())
    );
    if (response.statusCode == 200) {
      return List<Zzz>.from(
          jsonDecode(response.body).map((z) => Zzz.fromJson(z))
      );
    } else {
      throw Exception(
          'Failed to load' + widget.user.username.toString() + "'s todos"
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: totalBar(context),
      drawer: totalDrawer(context),
      body: Container(
        child: FutureBuilder(
          future: fetchTodos(),
          builder: (BuildContext context, AsyncSnapshot<List<Zzz>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              chs(s: widget.user.name),
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(chs(s: widget.user.username)),
                            Text(chs(s: widget.user.phone)),
                            Text(chs(s: widget.user.email)),
                            Text(chs(s: widget.user.address?.getAddress())),
                            Text(chs(s: widget.user.company?.name),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    child: const Text("TODOS:"),
                  ),
                  for (var item in snapshot.data!)
                    Card(
                      elevation: 1,
                      child: ListTile(
                        onTap: () {},
                        title: Text(chs(s: item.title)),
                        trailing:
                        Checkbox(value: item.completed, onChanged: null),
                      ),
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
