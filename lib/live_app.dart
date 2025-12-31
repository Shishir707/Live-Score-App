import 'package:flutter/material.dart';
import 'model_class.dart';

class LiveApp extends StatefulWidget {
  const LiveApp({super.key});

  @override
  State<LiveApp> createState() => _LiveAppState();
}

class _LiveAppState extends State<LiveApp> {
  final List<FootballMatch> _footballMatches = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Live Score App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(radius: 8, backgroundColor: Colors.green),
            title: Text("Bangladesh VS Australia"),
            subtitle: Text("Winner Team: Pending..."),
            trailing: Text("2:3", style: TextTheme.of(context).titleLarge),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

