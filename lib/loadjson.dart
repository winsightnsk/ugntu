import 'dart:convert';
import 'package:berkana/loadjsonadd.dart';
import 'package:berkana/widget_totalbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'class_users.dart';
import 'cnstnts.dart';

class LoadJSON extends StatefulWidget {
  static String rote = 'LoadJSON';
  const LoadJSON({Key? key}) : super(key: key);
  @override
  _LoadJSONState createState() => _LoadJSONState();
}

class _LoadJSONState extends State<LoadJSON> {
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
          child: const ListJSON(),
        )
    );
  }
}

class ListJSON extends StatefulWidget {
  const ListJSON({Key? key}) : super(key: key);
  @override
  _ListJSONState createState() => _ListJSONState();
}

class _ListJSONState extends State<ListJSON> {
  late Future<List<User>> futureUsersList;
  //late List<User> usersListData;
  @override
  void initState() {
    super.initState();
    futureUsersList = _fetchUsersList();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<User>>(
            future: futureUsersList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //List<User> usersListData = snapshot.data!;
                return _usersListView(context, snapshot.data!/*usersListData*/);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            })
    );
  }
}

ListView _usersListView(BuildContext context, List<User>data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userListTile(context, data[index], Icons.account_circle);
      });
}

ListTile _userListTile(BuildContext context, User data, IconData icon) {
  return ListTile(
    title: Text(
      data.name ?? '---',
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
        fontSize: 33,
        color: Colors.brown,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 10.0,
            color: Colors.brown,
          ),
        ],
      ),
    ),
    subtitle: Text(
      data.email ?? 'Нет записи',
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
        color: Colors.teal,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 10.0,
            color: Colors.teal,
          ),
        ],
      ),
    ),
    leading:
    Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 31, 232, 0.2),
              blurRadius: 5.0,
            ),
          ]
      ),
      child: Icon(
        icon,
        size: 40,
        color: Colors.teal[500],
      ),
    ),
    onTap: //()=> showDetales(context, data),
    ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => LoadJSONadd(data)))
  );
}

Future<List<User>> _fetchUsersList() async {
  final response = await http.get(Uri.parse(urlGetUsersList));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users from API');
  }
}