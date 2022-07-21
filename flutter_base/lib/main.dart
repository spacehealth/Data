import 'package:collapsible_navigation_drawer_example/provider/navigation_provider.dart';

// import 'package:collapsible_navigation_drawer_example/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'CPRapp';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.red),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Color> _colors = [Colors.white, Colors.red, Colors.green];
  var _backgroundColor = 0;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) => Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      backgroundColor: _colors[_backgroundColor],
      body: Center(
          child: Visibility(
              visible: _isVisible,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200.0)),
                    minimumSize: Size(300, 300),
                  ),
                  onPressed: () {
                    setState(() {
                      _isVisible = false;
                      _startCPR(); //Backend
                    });
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Start CPR", style: TextStyle(fontSize: 50)),
                        Icon(Icons.emergency_outlined, size: 50),
                      ])))));

  void _startCPR() {
    _backgroundColor += 2;
  }
}
