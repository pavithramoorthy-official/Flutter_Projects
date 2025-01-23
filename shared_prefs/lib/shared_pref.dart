import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  late bool _isDarkMode;

  @override
  void initState() {
    _isDarkMode = widget.isDarkMode;
    super.initState();
  }

  _toggleTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      prefs.setBool('isDarkMode', _isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Shared Preferences",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? Colors.black : Colors.black
            ),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dark Mode",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w400),),
              const SizedBox(width: 10,),
              Switch(
                value: _isDarkMode,
                onChanged: (value){
                  _toggleTheme();
                },
                activeColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
        ),
      ),
    );

  }
}
