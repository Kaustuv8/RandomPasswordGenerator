import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
void main() {
  runApp(MyWidget());
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  String Pwd = "";
  void buttonClicked1() {
    setState(() {       
      Pwd = RandomPassword();
      });      
  }
  void buttonClicked2(){
    setState(() {
      Pwd = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Center(
          child :Text(
            "Password Generator")
            ),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                      child: TextButton(
                        onPressed: buttonClicked1,
                        child: Text("Clck To Generate a Password")),
              ),
                Container(
                  child: Text(Pwd)
                ),
                SizedBox(
                  height:20
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: buttonClicked2, 
                    child: Text("Clear"),
                  ),
                )  
             ],),
              ),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
  )));
  }
}
String RandomPassword(){
  final R = new Random();
  String AlphabetLower = "abcdefghijklmnopqrstuvwxyz";
  String AlphabetHigher = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String Number = "0123456789";
  String Spchar = "!@#%^&*()_+-={}[];:<,.>/?`~";
  String Pwd = "";
  int prob;
  for(int i = 0; i<8+R.nextInt(20-8); i++){
    prob = R.nextInt(5);
    if (i==0){
      if(prob==0) Pwd+=AlphabetLower[R.nextInt(AlphabetLower.length)];
      else Pwd+=AlphabetHigher[R.nextInt(AlphabetHigher.length)];
    }
    else if (prob == 0 || prob == 1 ){
      Pwd+=AlphabetLower[R.nextInt(AlphabetLower.length)];
    }
    else if(prob == 2){
      Pwd+=AlphabetHigher[R.nextInt(AlphabetHigher.length)];
    }
    else if(prob == 3){
      Pwd+=Number[R.nextInt(Number.length)];
    }
    else if(prob == 4){
      Pwd+=Spchar[R.nextInt(Spchar.length)];
    }
  }
  return Pwd;
}

