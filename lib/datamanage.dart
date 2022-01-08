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
  int _counter = 0;

  @override
  void initState(){
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ощепков В.М.',),
          actions: [
            IconButton(
              onPressed: _incrementCounter,
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
                const SizedBox(height: 80,),
                Row(
                  children: [
                    Expanded(child: Container()),
                    const Icon(
                      Icons.app_registration,
                      color: Color(0xFF0079D0),
                      size: 30.0,
                    ),
                    Text('Работа с данными', style: Theme.of(context).textTheme.bodyText1),
                    Expanded(child: Container()),
                  ],
                ),
                const Divider(color: Colors.black),
                Text('Чтобы зарегистрироваться введите свой номер телефона и почту',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:1, child: Container()),
                    const Expanded(flex:4,
                      child: SizedBox(//width: 224,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFeceff1),
                            enabledBorder: borderStyle,
                            focusedBorder: borderStyle,
                            labelText: '+7',
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:1, child: Container()),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex:1, child: Container()),
                    const Expanded(flex:4,
                      child: SizedBox(width: 224,
                        child: TextField(
                          style: TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFeceff1),
                            enabledBorder: borderStyle,
                            focusedBorder: borderStyle,
                            labelText: 'E-mail',
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:1, child: Container()),
                  ],
                ),
                Text('Вам придет четырёхзначный код, который будет вашим паролем',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1
                ),
                Text('Изменить пароль можно будет в личном кабинете после регистрации',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1
                ),
                const SizedBox(height: 28,),
                SizedBox(
                    width: 200,
                    height: 42,
                    child:
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0079D0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36)
                            )
                        ),
                        onPressed: () {},
                        child: const Text('Отправить код', style: TextStyle(fontFamily: 'gabriola', fontSize: 26))
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}