import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat direct',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Wc(),
    );
  }
}
class Wc extends StatefulWidget {
  const Wc({Key? key}) : super(key: key);

  @override
  _WcState createState() => _WcState();
}

class _WcState extends State<Wc> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Direct Chat')),
        
      ),
      body: Container(

        padding: EdgeInsets.all(38),
        child: Column(

          children: [
            Container(   decoration: BoxDecoration(
                color: Color(0XFFEFF3F6),
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(6, 2),
                      blurRadius: 6.0,
                      spreadRadius: 3.0
                  ),
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(-6, -2),
                      blurRadius: 6.0,
                      spreadRadius: 3.0
                  )
                ]
            ),
              child: TextField(

                controller: _controller,
                keyboardType: TextInputType.number,

                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                 labelText: "Enter Phone Number",
                  border: InputBorder.none,



                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              child: ElevatedButton(onPressed: ()=>{sendMessage(context)},

                child: Icon(Icons.send),

              ),
            ),


          ],
        ),
      ),
    );
  }
  final snackbar= SnackBar(content: Text("Enter valid mobile no"),
  backgroundColor: Colors.red);
  void sendMessage(context){
   var txt=_controller.text;
   if(txt.length<10 || txt.length>10){
     ScaffoldMessenger.of(context).showSnackBar(snackbar);
   }
   else{

     _launchURL(txt);
   }
  }
 var _url ="https://api.whatsapp.com/send?phone=91 ";
  void _launchURL(txt) async =>
      await canLaunch(_url+txt) ? await launch(_url+txt) : throw 'Could not launch $_url';
}
