import 'package:berkana/enterpage.dart';
import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class RegPage extends StatefulWidget {
  static String rote = 'RegPage';
  const RegPage({Key? key}) : super(key: key);
  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  late TextEditingController _controller;
  late TextEditingController _controller1;
  void _regChel() async {
    final prefs = await SharedPreferences.getInstance();
    if (_controller.text.length==10 && _controller1.text!=''){
      try {
        int.parse(_controller.text);
        prefs.setString(_controller.text, _controller1.text);
        Navigator.pushNamed(context, EnterPage.rote);
      }
      catch (e) {
        showFiga(context);
      }
    } else {
      showFiga(context);
    }
  }

  @override
  void initState(){
    super.initState();
    _controller=TextEditingController(text: '');
    _controller1=TextEditingController(text: '');
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: Container()),
                  const Icon(
                    Icons.app_registration,
                    color: Colors.black12,
                    size: 30.0,
                  ),
                  Text('Регистрация', style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.teal)),
                  Expanded(child: Container()),
                ],
              ),
              const Divider(color: Colors.black),
              Text('Введите свой номер телефона (10 цифр)\nи пароль',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(flex:1, child: Container()),
                  Expanded(flex:4,
                    child: SizedBox(//width: 224,
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
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
                  Expanded(flex:4,
                    child: SizedBox(width: 224,
                      child: TextField(
                        controller: _controller1,
                        obscureText: true,
                        style: const TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFeceff1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex:1, child: Container()),
                ],
              ),
              const SizedBox(height: 28,),
              SizedBox(
                  width: 200,
                  height: 42,
                  child:
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF7998AC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36)
                          )
                      ),
                      onPressed: () => _regChel(),
                      child: Text('Выполнить', style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white))
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}