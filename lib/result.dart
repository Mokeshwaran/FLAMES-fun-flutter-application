// ignore_for_file: prefer_const_constructors

import 'package:flames/history.dart';
import 'package:flames/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String name, partnerName;
  List<String>? history;
  List<String>? flames;
  Result(
      {Key? key,
      required this.name,
      required this.partnerName,
      this.history,
      this.flames})
      : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<String> flames = ['F', 'L', 'A', 'M', 'E', 'S'];
  @override
  Widget build(BuildContext context) {
    List<String>? history = widget.history;
    List<String>? flames2 = widget.flames;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios_new_outlined),
            onTap: () => Navigator.pop(context)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
                child: Icon(Icons.history_rounded, color: Colors.white),
                onTap: () async {
                  if (history?.length == flames2?.length) {
                    print(history);
                    print(flames2);
                  }
                  await Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => History(
                        history: widget.history,
                        flames: flames2,
                      ),
                    ),
                  );
                }),
          ),
        ],
        title: Center(
          child: Text(
            widget.name + ' & ' + widget.partnerName,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(padding: EdgeInsets.all(10.0), child: results()),
          ),
        ],
      ),
      backgroundColor: const Color(0xffffd700),
    );
  }

  results() {
    List<String> resultName = widget.name.toLowerCase().split('');
    List<String> resultNameR = widget.name.toLowerCase().split('');
    List<String> resultPartnerName = widget.partnerName.toLowerCase().split('');
    List<String> resultPartnerNameR =
        widget.partnerName.toLowerCase().split('');
    int sumResultName =
        widget.name.toLowerCase().codeUnits.fold(0, (p, c) => p + c);
    int sumResultPartnerName =
        widget.partnerName.toLowerCase().codeUnits.fold(0, (p, c) => p + c);

    if (sumResultName != sumResultPartnerName) {
      for (var elem in resultPartnerName) {
        resultNameR.remove(elem);
      }

      for (var elem in resultName) {
        resultPartnerNameR.remove(elem);
      }
      int differenceName = resultNameR.length;
      int differencePartnerName = resultPartnerNameR.length;
      int total = differenceName + differencePartnerName;

      for (int i = 0; i < 6; i++) {
        while (flames.length != 1) {
          int number = (total % flames.length) - 1;
          if (number >= 0) {
            flames.removeAt(number);
            flames = flames.sublist(number) + flames.sublist(0, number);
          } else if (number < 0) {
            flames.removeAt(flames.length - 1);
            flames = flames.sublist(number + 1) + flames.sublist(0, number + 1);
          }
        }
      }
      return flamesfunc(flames);
    } else {
      return SizedBox(
        child: Text('You Entered The Same Name Or You Just Met Your Alter-Ego!',
            softWrap: true, textAlign: TextAlign.center, style: style),
      );
    }
  }

  flamesfunc(f) {
    List<String>? flames2 = widget.flames;

    if (f[0] == 'F') {
      flames2?.insert(flames2.length, flames[0]);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25.0,
            child: Text('You got a',
                style: style2, softWrap: true, textAlign: TextAlign.center),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text('F',
                style: style_f, softWrap: true, textAlign: TextAlign.center),
          ),
        ],
      );
    } else if (f[0] == 'L') {
      flames2?.insert(flames2.length, flames[0]);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25.0,
            child: Text('Take the',
                style: style2, softWrap: true, textAlign: TextAlign.center),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text('L',
                style: style_l, softWrap: true, textAlign: TextAlign.center),
          ),
        ],
      );
    } else if (f[0] == 'A') {
      flames2?.insert(flames2.length, flames[0]);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25.0,
            child: Text('Meh, you got an',
                style: style2, softWrap: true, textAlign: TextAlign.center),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text('A',
                style: style_a, softWrap: true, textAlign: TextAlign.center),
          ),
        ],
      );
    } else if (f[0] == 'M') {
      flames2?.insert(flames2.length, flames[0]);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25.0,
            child: Text('You got a',
                style: style2, softWrap: true, textAlign: TextAlign.center),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text('M',
                style: style_m, softWrap: true, textAlign: TextAlign.center),
          ),
        ],
      );
    } else if (f[0] == 'E') {
      flames2?.insert(flames2.length, flames[0]);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25.0,
            child: Text('Oof! you got an',
                style: style2, softWrap: true, textAlign: TextAlign.center),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text('E',
                style: style_e, softWrap: true, textAlign: TextAlign.center),
          ),
        ],
      );
    } else if (f[0] == 'S') {
      flames2?.insert(flames2.length, flames[0]);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25.0,
            child: Text('You got a',
                style: style2, softWrap: true, textAlign: TextAlign.center),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Text('S',
                style: style_s, softWrap: true, textAlign: TextAlign.center),
          ),
        ],
      );
    }
  }
}
