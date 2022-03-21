// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flames/styles.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  List<String>? history;
  List<String>? flames;
  History({Key? key, this.history, this.flames}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    List<String>? history;
    history = widget.history;
    List<String>? flames;
    flames = widget.flames;
    print(flames);
    // List<String> partnerNameHistory = [];
    // partnerNameHistory.insert(partnerNameHistory.length, widget.partnerName);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: const Text(
            'History',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xffffd700),
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: ListView.builder(
          itemCount: history?.length,
          itemBuilder: (context, index) {
            colorHistory(index);
            return Dismissible(
              background: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        color: Color(0xffeb0029),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              key: UniqueKey(),
              onDismissed: (direction) {
                history?.remove(history[index]);
                flames?.remove(flames[index]);
              },
              child: Card(
                margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Text(
                    flames![index],
                    style: colorHistory(index),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: Colors.white,
                  title: Text(
                    history![index],
                    //textAlign: TextAlign.center,
                    style: style5,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  colorHistory(index) {
    List<String>? flames;
    flames = widget.flames;
    if (flames?[index] == 'F') {
      return TextStyle(
          color: Colors.blue[300], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'L') {
      return TextStyle(
          color: Colors.pink[600], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'A') {
      return TextStyle(
          color: Colors.pink[200], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'M') {
      return TextStyle(
          color: Colors.green[700],
          fontWeight: FontWeight.w900,
          fontSize: 25.0);
    } else if (flames?[index] == 'E') {
      return TextStyle(
          color: Color(0xffeb0029),
          fontWeight: FontWeight.w900,
          fontSize: 25.0);
    } else if (flames?[index] == 'S') {
      return TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 25.0);
    }
  }
}
