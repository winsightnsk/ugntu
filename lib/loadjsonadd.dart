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
                          Text('User name: ', ),
                          Expanded(child: Text(chs(s: widget.user.username), textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyText1,),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Phone: '),
                          Expanded(child: Text(chs(s: widget.user.phone), textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyText1,)),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('E-mail: '),
                          Expanded(child: Text(chs(s: widget.user.email), textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyText1,),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Address: '),
                          Expanded(child:
                            Text(chs(s: widget.user.address?.getAddress()), textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyText1,),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Company: '),
                          Expanded(child:
                            Text(chs(s: widget.user.company?.name), textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyText1,),
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
