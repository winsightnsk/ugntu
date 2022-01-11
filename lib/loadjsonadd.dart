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
  TextStyle s = const TextStyle(
    fontSize: 25,
    color: Colors.brown,
    fontFamily: 'resphekt',
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 10.0,
        color: Colors.white,
      ),
    ],
  );

  TextStyle ss = const TextStyle(
    fontSize: 26,
    fontFamily: 'gabriola',
    color: Colors.brown,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 6.0,
        color: Colors.white,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: totalBar(context),
        drawer: totalDrawer(context),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/epfon.jpg'),
                fit: BoxFit.cover,
              )
          ),
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
              future: fetchTodos(),
              builder: (BuildContext context, AsyncSnapshot<List<Zzz>> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      Row(
                        children: [
                          Text('User name: ', style: s,),
                          Expanded(child: Text(chs(s: widget.user.username), textAlign: TextAlign.right, style: ss)),
                        ],
                      ),const Divider(),
                      Row(
                        children: [
                          Text('Phone: ', style: s),
                          Expanded(child: Text(chs(s: widget.user.phone), textAlign: TextAlign.right, style: ss)),
                        ],
                      ),const Divider(),
                      Row(
                        children: [
                          Text('E-mail: ', style: s),
                          Expanded(child: Text(chs(s: widget.user.email), textAlign: TextAlign.right, style: ss)),
                        ],
                      ),const Divider(),
                      Row(
                        children: [
                          Text('Address: ', style: s),
                          Expanded(child:
                            Text(chs(s: widget.user.address?.getAddress()), textAlign: TextAlign.right, style: ss),
                          ),
                        ],
                      ),const Divider(),
                      Row(
                        children: [
                          Text('Company: ', style: s),
                          Expanded(child:
                            Text(chs(s: widget.user.company?.name), textAlign: TextAlign.right, style: ss),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Text("TODOS:"),
                      for (var item in snapshot.data!)
                        Card(
                          elevation: 3,
                          child: ListTile(
                            tileColor: const Color.fromRGBO(
                                217, 255, 231, 1.0),
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
        )
    );
  }
}
