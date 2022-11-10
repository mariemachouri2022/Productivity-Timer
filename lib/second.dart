import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
 const MyApp({super.key});
 
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Productivity Timer',
 theme: ThemeData(
 primarySwatch: Colors.red,
 ),
 home: MyHomePage(title: 'Productivity Timer'),
 );
 }
}
 
class MyHomePage extends StatelessWidget {
 final String title;
 const MyHomePage({super.key, required this.title});
 
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size.width;
 return Scaffold(
 appBar: AppBar(
 title: Text(title),
 ),
 body: Center(
 child: Column(
 children: [
 Row(
 mainAxisAlignment:
 MainAxisAlignment.spaceEvenly,
 children: <Widget>[
 TomatoButton(Colors.red, "Pomodoro",
 () => {}, size / 3.2),
 TomatoButton(Color(0xff8BC34A),
 "Short Break", () => {}, size / 3.2),
 TomatoButton(Color(0xff689F38),
 "Long Break", () => {}, size / 3.2),
 ],
 ),
 Expanded(
 child: CircularPercentIndicator(
 radius: 180.0,
 lineWidth: 10.0,
 percent: 0.5,
 center: Text("25.0",
 style: Theme.of(context)
 .textTheme
 .bodyText1),
 progressColor: Colors.green,
 ),
 ),
 Row(
 children: [
 TomatoButton(Colors.red, "Stop", () => {},
 size / 2.1),
 TomatoButton(Color(0xff689F38), "Restart",
 () => {}, size / 2.1),
 ],
 ),
 ],
 ),
 ));
 }
}
 
class TomatoButton extends StatelessWidget {
 final Color color;
 final String text;
 final double size;
 final VoidCallback onPressed;
 
 TomatoButton(
 this.color, this.text, this.onPressed, this.size);
 @override
 Widget build(BuildContext context) {
 return MaterialButton(
 child: Text(this.text,
 style: TextStyle(color: Colors.white)),
 onPressed: this.onPressed,
 color: this.color,
 minWidth: this.size,
 );
 }
}