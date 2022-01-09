import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';



class DataManage extends StatefulWidget {
  static String rote = 'DataManage';
  const DataManage({Key? key}) : super(key: key);

  @override
  State<DataManage> createState() => _DataManageState();
}

class _DataManageState extends State<DataManage> {
  List<int> _counter = [0,0];
  late TextEditingController _controller;
  late TextEditingController _controller1;

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
        //TODO file me
          break;
      }
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
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
                  onPressed: (){},
                  child: Text('but1',style: Theme.of(context).textTheme.bodyText1,),
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
                    labelText: 'tf2',
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}