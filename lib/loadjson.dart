import 'dart:convert';
import 'package:berkana/widget_totalbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const String urlGetUsersList = "https://jsonplaceholder.typicode.com/users";

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
  late List<User> usersListData;
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
                usersListData = snapshot.data!;
                return _usersListView(context, usersListData);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            })
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

ListView _usersListView(BuildContext context, data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _userListTile(context, data[index].name, data[index].email, Icons.account_circle);
      });
}

ListTile _userListTile(BuildContext context, String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 33, color: Colors.brown),
    ),
    subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.teal)),
    leading: Icon(
      icon,
      size: 40,
      color: Colors.teal[500],
    ),
    onTap: ()=>showDetales(context),
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


Future showDetales(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('1', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.right,),
        content: Text('2', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
        actions: <Widget>[
          InkWell(
            child: Text('Увидел', style: Theme.of(context).textTheme.headline1),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}