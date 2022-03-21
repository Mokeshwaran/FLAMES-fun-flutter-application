// ignore_for_file: unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flames/result.dart';
import 'package:flames/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wrapper extends StatefulWidget {
  final List<String>? history;
  final List<String>? flames;
  Wrapper({Key? key, this.history, this.flames}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late FocusNode _focusNode;
  late FocusNode _focusNode2;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController partnerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    _focusNode2 = FocusNode();
    _focusNode2.addListener(_onOnFocusNodeEvent);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    late String name;
    late String partnerName;
    late List<String>? history = widget.history;
    late List<String>? flames = widget.flames;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.blue[800],
          elevation: 0.0,
        ),
        body: ListView(children: [
          Form(
            key: _formKey,
            child: Container(
              color: const Color(0xffffd700),
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 84,
                        width: 158.0,
                        child: Center(
                          child: Text(
                            'They Are Your ',
                            style: style3,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(
                              'Friend',
                              textStyle: style_ff,
                              //duration: Duration(milliseconds: 500),
                            ),
                            RotateAnimatedText(
                              'Lover',
                              textStyle: style_ll,
                              //duration: Duration(milliseconds: 500),
                            ),
                            RotateAnimatedText(
                              'Affectionate',
                              textStyle: style_aa,
                              //duration: Duration(milliseconds: 500),
                            ),
                            RotateAnimatedText(
                              'Marriage Partner',
                              textStyle: style_mm,
                              //duration: Duration(milliseconds: 500),
                            ),
                            RotateAnimatedText(
                              'Enemy',
                              textStyle: style_ee,
                              //duration: Duration(milliseconds: 500),
                            ),
                            RotateAnimatedText(
                              'Soul Mate',
                              textStyle: style_ss,
                              //duration: Duration(milliseconds: 500),
                            ),
                            FadeAnimatedText(
                              'Everything',
                              textStyle: style4,
                              duration: Duration(milliseconds: 5000),
                            ),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                      autofocus: false,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      ],
                      textInputAction: TextInputAction.next,
                      focusNode: _focusNode,
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Name',
                          hintStyle:
                              TextStyle(color: _getTextBoxBackgroundColor2()),
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: _getTextBoxBackgroundColor2(),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade800, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orange.shade600, width: 2.0),
                              borderRadius: BorderRadius.circular(50)),
                          filled: true,
                          fillColor: _getTextBoxBackgroundColor()),
                      cursorColor: _getTextBoxBackgroundColor2(),
                      style: TextStyle(
                        color: _getTextBoxBackgroundColor2(),
                        fontSize: 17.0,
                      ),
                      validator: (value) => value!.isEmpty
                          ? 'Name must contain atleast 1 character'
                          : null,
                      onChanged: (value) {
                        setState(() => name = value);
                      }),
                  const SizedBox(height: 20.0),
                  TextFormField(
                      autofocus: false,
                      focusNode: _focusNode2,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      ],
                      textInputAction: TextInputAction.done,
                      controller: partnerController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Partner\'s Name',
                          hintStyle:
                              TextStyle(color: _getTextBox2BackgroundColor2()),
                          prefixIcon: Icon(
                            Icons.supervisor_account_rounded,
                            color: _getTextBox2BackgroundColor2(),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade800, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orange.shade600, width: 2.0),
                              borderRadius: BorderRadius.circular(50)),
                          filled: true,
                          fillColor: _getTextBox2BackgroundColor()),
                      cursorColor: _getTextBox2BackgroundColor2(),
                      style: TextStyle(
                        color: _getTextBox2BackgroundColor2(),
                        fontSize: 17.0,
                      ),
                      validator: (value) => value!.isEmpty
                          ? 'Partner\'s name must contain atleast 1 character'
                          : null,
                      onChanged: (value) {
                        setState(() => partnerName = value);
                      }),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            history?.insert(
                                history.length,
                                nameController.text +
                                    ' & ' +
                                    partnerController.text);
                          });
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) => Result(
                                name: nameController.text,
                                partnerName: partnerController.text,
                                history: history,
                                flames: flames,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Predict!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade800),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  )
                ],
              ),
            ),
          ),
        ]));
  }

  Color _getTextBoxBackgroundColor() {
    return _focusNode.hasFocus ? Colors.orange.shade100 : Colors.blue.shade100;
  }

  Color _getTextBoxBackgroundColor2() {
    return _focusNode.hasFocus ? Colors.orange.shade800 : Colors.blue.shade800;
  }

  Color _getTextBox2BackgroundColor() {
    return _focusNode2.hasFocus ? Colors.orange.shade100 : Colors.blue.shade100;
  }

  Color _getTextBox2BackgroundColor2() {
    return _focusNode2.hasFocus ? Colors.orange.shade800 : Colors.blue.shade800;
  }
}
