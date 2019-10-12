import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Hello LayoutBuilder Exam'),
        ),
        body:LayoutBuilder(
          builder:(BuildContext ctx,BoxConstraints constrains){
            if (constrains.maxWidth > 600){
              return _wideView();
            }else{
              return _shallowView();
            }
          } ,
        )
    );
  }

  Widget _wideView() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(
            child: ColorBox(Colors.blue),
          ),
          Expanded(
              child:ColorBox(Colors.red)
          ),
          Expanded(
              child:ColorBox(Colors.yellow)
          )
        ]
    );
  }

  Widget _shallowView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child:ColorBox(Colors.blue),
        ),
        Expanded(
          child:ColorBox(Colors.red),
        ),
        Expanded(
          child:ColorBox(Colors.yellow),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class ColorBox extends StatelessWidget {
  Color color;
  ColorBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
      ),
    );
  }

}

