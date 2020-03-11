import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_dark_mode_switch/dark_mode_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkModeProvider darkModeProvider = DarkModeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    darkModeProvider.darkMode =
        await darkModeProvider.darkModePreference.isDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => darkModeProvider),
      ],
      child: Consumer<DarkModeProvider>(
        builder: (BuildContext context, DarkModeProvider darkModeProvider, _) {
          return MaterialApp(
            title: 'Flutter Provider Dark Mode Switch',
            debugShowCheckedModeBanner: false,
            theme: darkModeProvider.darkMode ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkModeState = Provider.of<DarkModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Dark Mode Switch"),
      ),
      body: Center(
        child: Switch(
            value: darkModeState.darkMode,
            onChanged: (value) => darkModeState.darkMode = value),
      ),
    );
  }
}
