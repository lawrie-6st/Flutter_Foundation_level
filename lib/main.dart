import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/first':(context)=> const FirstPage(), //同じ、ルートディレクトリは指定できないので、firstを利用する。
        '/second':(context)=>const SecondPage('yobidashi second')},
      title: 'Flutter Demo',
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("first page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){Navigator.pushNamed(context,'/second',arguments: 'yobidashi yade second');},
          child: const Text('next')
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String messageFromFirst;
  const SecondPage(this.messageFromFirst, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
        leading: CloseButton(onPressed: (){ //デフォルトのクローズや、バックボタンはleadingを指定しないとダメあ。
          Navigator.of(context).pop('closeButtonやで');
          //https://zenn.dev/chooyan/articles/77a2ba6b02dd4f
        }),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/first'); // 元の画面に戻ることができる。（自動で、戻るボタンも左上に追加される。
            },
            child: Text(messageFromFirst)
        ),
      ),
    );
  }
}