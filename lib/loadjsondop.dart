import 'dart:convert';
import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'class_users.dart';

const String urlGetZzzList = "https://jsonplaceholder.typicode.com/todos?userId=1";

// class LoadJsonDop extends StatefulWidget {
//   static String rote = 'LoadJsonDop';
//   final User data;
//   const LoadJsonDop(BuildContext context,{required this.data, Key? key}) : super(key: key);
//
//   @override
//   _LoadJsonDopState createState() => _LoadJsonDopState();
// }
//
// class _LoadJsonDopState extends State<LoadJsonDop> {
//   late Future<List<Zzz>> futureZzzList;
//   late List<Zzz> usersZzzData;
//   @override
//   void initState() {
//     super.initState();
//     futureZzzList = _fetchZzzList(widget.data.id??-1);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(children: [Flexible(child: Text('id: '+chs(i: widget.data.id), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('username: '+chs(s: widget.data.username), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('e-mail: '+chs(s: widget.data.email), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('phone: '+chs(s: widget.data.phone), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('website: '+chs(s: widget.data.website), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Text('address', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
//             Row(children: [Flexible(child: Text('city: '+chs(s: widget.data.address?.city), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('suite: '+chs(s: widget.data.address?.suite), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('zipcode: '+chs(s: widget.data.address?.zipcode), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Text('geo', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
//             Row(children: [Flexible(child: Text('lat: '+chs(s: widget.data.address?.geo?.lat), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('lng: '+chs(s: widget.data.address?.geo?.lng), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Text('company', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
//             Row(children: [Flexible(child: Text('name: '+chs(s: widget.data.company?.name), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('catchPhrase: '+chs(s: widget.data.company?.catchPhrase), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             Row(children: [Flexible(child: Text('bs: '+chs(s: widget.data.company?.bs), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
//             FutureBuilder<List<Zzz>>(
//                 future: futureZzzList,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     usersZzzData = snapshot.data!;
//                     return _zzzListView(context, usersZzzData);
//                       //_zzzRow(context, usersZzzData);
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   return const CircularProgressIndicator();
//                 })
//           ],
//         ),
//       );
//   }
// }


Future<List<Zzz>> _fetchZzzList(int id) async {
  final response = await http.get(Uri.parse(urlGetZzzList));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    List<Zzz> jr = jsonResponse.map((zzz) => Zzz.fromJson(zzz)).toList();
    List<Zzz> res= [];
    for (var element in jr) {
      if (element.userId==id){
        res.add(element);
      }
    }
    return res;
  } else {
    throw Exception('Failed to load users from API');
  }
}


class LoadJSONDop extends StatefulWidget {
  static String rote = 'LoadJsonDop';
  final User data;
  const LoadJSONDop(this.data, {Key? key}) : super(key: key);

  @override
  _LoadJSONDopState createState() => _LoadJSONDopState();
}

class _LoadJSONDopState extends State<LoadJSONDop> {
  late Future<List<Zzz>> futureZzzList;
  late List<Zzz> usersZzzData;
  @override
  void initState() {
    super.initState();
    futureZzzList = _fetchZzzList(widget.data.id??-1);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: totalBar(context),
        drawer: totalDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(children: [Flexible(child: Text('id: '+chs(i: widget.data.id), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('username: '+chs(s: widget.data.username), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('e-mail: '+chs(s: widget.data.email), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('phone: '+chs(s: widget.data.phone), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('website: '+chs(s: widget.data.website), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Text('address', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
              Row(children: [Flexible(child: Text('city: '+chs(s: widget.data.address?.city), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('suite: '+chs(s: widget.data.address?.suite), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('zipcode: '+chs(s: widget.data.address?.zipcode), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Text('geo', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
              Row(children: [Flexible(child: Text('lat: '+chs(s: widget.data.address?.geo?.lat), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('lng: '+chs(s: widget.data.address?.geo?.lng), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Text('company', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.left,),
              Row(children: [Flexible(child: Text('name: '+chs(s: widget.data.company?.name), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('catchPhrase: '+chs(s: widget.data.company?.catchPhrase), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              Row(children: [Flexible(child: Text('bs: '+chs(s: widget.data.company?.bs), style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,))],),
              FutureBuilder<List<Zzz>>(
                  future: futureZzzList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      usersZzzData = snapshot.data!; //TODO - По всей видимости сюда передаются не те данные!!!!
                      return _zzzListView(context, usersZzzData);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  })
            ],
          ),
        ),
      );
  }
}

ListView _zzzListView(BuildContext context, List<Zzz> data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _zzzListTile(context, data[index]);
        //const Text('dd');
      });
}

ListTile _zzzListTile(BuildContext context, Zzz data,) {
  return const ListTile(title: Text('dddd'));
    // ListTile(
    //     title: Text(
    //       data.title ?? '---',
    //       style: Theme.of(context).textTheme.bodyText1,
    //     ),
    //     leading: Checkbox(
    //       value: data.completed,
    //       onChanged: (v){},
    //     )
    // );
}