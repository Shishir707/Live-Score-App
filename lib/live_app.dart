import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model_class.dart';

class LiveApp extends StatefulWidget {
  const LiveApp({super.key});

  @override
  State<LiveApp> createState() => _LiveAppState();
}

class _LiveAppState extends State<LiveApp> {
  final List<FootballMatch> _footballMatches = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // @override
  // initState() {
  //   super.initState();
  //   _fetchDatabase();
  // }
  //
  // Future<void> _fetchDatabase() async {
  //   _footballMatches.clear();
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
  //       .collection('Football')
  //       .get();
  //   for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
  //     _footballMatches.add(FootballMatch.fromJson(doc.data()));
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "⚽ Football Live Score",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: StreamBuilder(
        stream: _firestore.collection('Football').snapshots(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (asyncSnapshot.hasError) {
            return Center(child: Text("${asyncSnapshot.hasError}"));
          }

          if (asyncSnapshot.hasData) {
            _footballMatches.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
                in asyncSnapshot.data!.docs) {
              _footballMatches.add(FootballMatch.fromJson(doc.data()));
            }
            return uiResult();
          }

          return SizedBox();
        },
      ),
    );
  }

  ListView uiResult() {
    return ListView.separated(
      itemCount: _footballMatches.length,
      itemBuilder: (context, index) {
        final match = _footballMatches[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 10,
            backgroundColor: match.isRunning ? Colors.red : Colors.grey,
          ),
          title: Text(
            "${match.team1Name} VS ${match.team2Name}",
            style: TextTheme.of(context).titleLarge,
          ),
          subtitle: Text(
            match.winnerTeam.isEmpty
                ? "Winner Team : Pending..."
                : "Winner Team : ${match.winnerTeam}",
          ),
          trailing: Text(
            "${match.team1Score}:${match.team2Score}",
            style: TextTheme.of(context).titleLarge,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
