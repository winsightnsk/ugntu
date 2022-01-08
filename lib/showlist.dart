// import 'package:berkana/datamanage.dart';
import 'package:flutter/material.dart';

class ShowList extends StatefulWidget {
  static String rote = 'ShowList';
  const ShowList({Key? key}) : super(key: key);

  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  Widget _w=Container();
  Widget _ic=const Icon(Icons.accessibility, size: 40,);
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text='https://avatars.mds.yandex.net/i?id=99dee32faf5dbecaf3195da47511518d-4011431-images-thumbs&n=13&exp=1' ;
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ощепков В.М.',),
        actions: <Widget>[
          IconButton(
            onPressed:
              () {
                setState(
                  () {
                    _ic = const Icon(Icons.accessibility_new, size: 40,);
                    Future.delayed(const Duration(milliseconds: 100),
                      () => setState(() {
                        _ic = const Icon(Icons.accessibility, size: 40,);
                      })
                    );
                  }
                );
              },
            icon: const Icon(Icons.ac_unit)
          ),
          //TextButton(onPressed: () {Navigator.pushNamed(context, DataManage.rote);}, child: Text('Память',style: Theme.of(context).textTheme.bodyText1,)),
          const SizedBox(width: 50,),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                      ),
                      child: _w,
                    )
                  ],
                ),
              )
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Белый'),
              onTap: () => setState(() => _w=Container()),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Картинка'),
              onTap: () => setState(() => _w=Image.asset('assets/www.png', fit: BoxFit.contain,)),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('URL'),
              onTap: () => setState(() => _w=Image.network(_controller.text, fit: BoxFit.contain,)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(children: const [Text('URL:', textAlign: TextAlign.left,)]),
          TextField(
            minLines: 3,
            maxLines: 5,
            controller: _controller,
            onSubmitted: (String value) async {},
          ),
          Expanded(
            child:
              Center(
                child: ListView.builder(
                  padding: const EdgeInsets.all(2),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) =>
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: ListTile(
                          leading: _ic,
                          title: Text('$index-ый человечек'),
                          onTap: () {}
                        ),
                      )
                ),
              )
          )
        ],        
      ),
    );
  }
}


