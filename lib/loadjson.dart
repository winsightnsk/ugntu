import 'dart:convert';
import 'package:berkana/widget_totalbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'class_users.dart';

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

ListView _usersListView(BuildContext context, data) {
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
    onTap: ()=>showDetales(context, data),
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


Future showDetales(BuildContext context, User data) {
  TextStyle? ts=Theme.of(context).textTheme.bodyText1;
  String chs({int? i, String? s}){
    String res='';
    if (i!=null){
      res=i.toString();
    }
    if (s!=null){
      res=s;
    }
    return (res=='')? '---' : res;
  }
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(chs(s: data.name), style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.right,),
        content:
          SingleChildScrollView(
            child: Column(
            children: [
              Text('id: '+chs(i: data.id), style: ts, textAlign: TextAlign.left,),
              Text('username: '+chs(s: data.username), style: ts, textAlign: TextAlign.left,),
              Text('e-mail: '+chs(s: data.email), style: ts, textAlign: TextAlign.left,),
              Text('phone: '+chs(s: data.phone), style: ts, textAlign: TextAlign.left,),
              Text('website: '+chs(s: data.website), style: ts, textAlign: TextAlign.left,),
              Text('address', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
              Text('city: '+chs(s: data.address?.city), style: ts, textAlign: TextAlign.left,),
              Text('suite: '+chs(s: data.address?.suite), style: ts, textAlign: TextAlign.left,),
              Text('zipcode: '+chs(s: data.address?.zipcode), style: ts, textAlign: TextAlign.left,),
              Text('geo', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
              Text('lat: '+chs(s: data.address?.geo?.lat), style: ts, textAlign: TextAlign.left,),
              Text('lng: '+chs(s: data.address?.geo?.lng), style: ts, textAlign: TextAlign.left,),
              Text('company', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
              Text('name: '+chs(s: data.company?.name), style: ts, textAlign: TextAlign.left,),
              Text('catchPhrase: '+chs(s: data.company?.catchPhrase), style: ts, textAlign: TextAlign.left,),
              Text('bs: '+chs(s: data.company?.bs), style: ts, textAlign: TextAlign.left,),
            ],
          ),
          ),
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