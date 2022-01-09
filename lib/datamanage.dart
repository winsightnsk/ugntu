import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'dart:io';



class DataManage extends StatefulWidget {
  static String rote = 'DataManage';
  final CounterStorage storage;
  const DataManage({Key? key, required this.storage}) : super(key: key);

  @override
  State<DataManage> createState() => _DataManageState();
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory =await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }
  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

class _DataManageState extends State<DataManage> {
  final List<int> _counter = [0,0];
  late TextEditingController _controller;
  late TextEditingController _controller1;
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  void initState(){
    super.initState();
    _controller=TextEditingController(text: '');
    _controller1=TextEditingController(text: '');
    _loadCounter(0);
    _loadCounter(1);
  }

  void _loadCounter(int i) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      switch (i) {
        case 0:
          _counter[0] = prefs.getInt('counter') ?? 0;
          _controller.text= _counter[0].toString();
        break;
        case 1:
          widget.storage.readCounter().then((int value) {
            setState(() {_counter[1] = value;});
            _controller1.text= _counter[1].toString();
          });
        break;
      }
    });
  }
  void _incrementCounter(int i) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      switch (i) {
        case 0:
          _counter[0] = (prefs.getInt('counter') ?? 0) +1;
          prefs.setInt('counter', _counter[0]);
          _controller.text= _counter[0].toString();
          break;
        case 1:
          widget.storage.readCounter().then((int value) {
            setState(() {_counter[1] = value+1;});
          });
          widget.storage.writeCounter(_counter[1]);
          _controller1.text= _counter[1].toString();
          break;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ощепков В.М.',),
          actions: [
            IconButton(
              onPressed: () => _incrementCounter(0),
              tooltip: 'Increment',
              icon: const Icon(Icons.add, size: 40, color: Colors.brown,),
            ),
            const SizedBox(width: 50,)
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/epfon.jpg'),
              fit: BoxFit.cover,
            )
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    const Icon(
                      Icons.system_update_alt,
                      color: Colors.teal,
                      size: 30.0,
                    ),
                    Text('Работа с данными', style: Theme.of(context).textTheme.bodyText1),
                    Expanded(child: Container()),
                  ],
                ),
                const Divider(color: Colors.black),
                ElevatedButton(
                  onPressed: (){_incrementCounter(0);},
                  child: Text('+1',style: Theme.of(context).textTheme.bodyText1,),
                ),
                TextField(
                  controller: _controller,
                  style: const TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Prefs',
                  ),
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){_incrementCounter(1);},
                  child: Text('+1',style: Theme.of(context).textTheme.bodyText1,),
                ),
                TextField(
                  controller: _controller1,
                  style: const TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'File',
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}