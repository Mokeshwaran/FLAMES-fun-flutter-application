// ignore_for_file: avoid_web_libraries_in_flutter, must_be_immutable
import 'dart:math';

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
    bool his = history!.isEmpty;
    //print(flames);
    // List<String> partnerNameHistory = [];
    // partnerNameHistory.insert(partnerNameHistory.length, widget.partnerName);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios_new_outlined),
            onTap: () => Navigator.pop(context)),
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: history.isEmpty
            ? null
            : <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                      child: Icon(Icons.delete_rounded, color: Colors.white),
                      onTap: () async {
                        setState(() {
                          history?.clear();
                        });
                      }),
                ),
              ],
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xffffd700),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: his
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  empty(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  colorHistory(index);
                  return Dismissible(
                    background: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                      child: Container(
                        child: const Center(
                          child: Text(
                            'Deleted',
                            style: style6,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              color: const Color(0xffeb0029),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      history?.remove(history[index]);
                      flames?.remove(flames[index]);
                      if (history!.isEmpty) {
                        setState(() {
                          his = true;
                        });
                      }
                    },
                    child: Card(
                      margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: Text(
                          flames![index],
                          style: colorHistory(index),
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor: tileColor(index),
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

  empty() {
    var empty = <String>[
      '--There\'s nothing here--',
      '--I know, it\'s dead quiet in here--',
      '--Just type the names already--',
      '--Bro, come here after entering the names--',
      '--Dude! don\'t enter your name twice--',
      '--Empty--',
      '--Emmmmmptyyyyyy--',
      '--Trust me, there\'s nothing here!--',
      '--Look what you\'ve found... Nothing!--',
    ];

    Random random = Random();
    empty.shuffle();
    final a = random.nextInt(8);
    final e = empty.elementAt(a);
    return (e);
  }

  tileColor(index) {
    List<String>? flames;
    flames = widget.flames;
    if (flames?[index] == 'F') {
      return Colors.blue[900];
    } else if (flames?[index] == 'L') {
      return Colors.pink[900];
    } else if (flames?[index] == 'A') {
      return Colors.purple[900];
    } else if (flames?[index] == 'M') {
      return Colors.green[900];
    } else if (flames?[index] == 'E') {
      return Colors.red[900];
    } else if (flames?[index] == 'S') {
      return Colors.black;
    }
  }

  colorHistory(index) {
    List<String>? flames;
    flames = widget.flames;
    if (flames?[index] == 'F') {
      return TextStyle(
          color: Colors.blue[300], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'L') {
      return TextStyle(
          color: Colors.pink[200], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'A') {
      return TextStyle(
          color: Colors.pink[200], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'M') {
      return TextStyle(
          color: Colors.green[500],
          fontWeight: FontWeight.w900,
          fontSize: 25.0);
    } else if (flames?[index] == 'E') {
      return TextStyle(
          color: Colors.red[200], fontWeight: FontWeight.w900, fontSize: 25.0);
    } else if (flames?[index] == 'S') {
      return const TextStyle(
          color: Color.fromARGB(255, 129, 129, 129),
          fontWeight: FontWeight.w900,
          fontSize: 25.0);
    } else {
      return const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25.0);
    }
  }
}
