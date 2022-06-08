// ignore_for_file: unused_local_variable, prefer_const_constructors_in_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flames/loading.dart';
import 'package:flames/result.dart';
import 'package:flames/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool heart = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    _focusNode2 = FocusNode();
    _focusNode2.addListener(_onOnFocusNodeEvent);
    animatedtext();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
    // animatedtext().dispose();
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
        centerTitle: true,
        title: const Text(
          'Welcome To The World Of FLAMES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xffffd700),
        child: ListView(children: [
          Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.87,
              color: const Color(0xffffd700),
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
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
                        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: animatedtext(),
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
                      // validator: (value) => value!.isEmpty
                      //     ? 'Name must contain atleast 1 character'
                      //     : null,
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
                      // validator: (value) => value!.isEmpty
                      //     ? 'Partner\'s name must contain atleast 1 character'
                      //     : null,
                      onChanged: (value) {
                        setState(() => partnerName = value);
                      }),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: partnerController.text.isNotEmpty &&
                            nameController.text.isNotEmpty
                        ? ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  heart = true;
                                  if (nameController.text !=
                                      partnerController.text) {
                                    history?.insert(
                                        history.length,
                                        nameController.text +
                                            ' & ' +
                                            partnerController.text);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Same name/alter-ego will not be stored in history!"),
                                    ));
                                  }
                                });

                                Future.delayed(
                                    const Duration(milliseconds: 1000),
                                    () async {
                                  heart = false;
                                  Route yourCustomRoute() {
                                    return PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          Result(
                                        name: nameController.text,
                                        partnerName: partnerController.text,
                                        history: history,
                                        flames: flames,
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = const Offset(1, 0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                      transitionDuration: const Duration(
                                          seconds: 1), //any duration you want
                                    );
                                  }

                                  await Navigator.of(context,
                                          rootNavigator: true)
                                      .push(yourCustomRoute());
                                });
                              }
                            },
                            child: const Text('Predict!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade800),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: null,
                            child: nameController.text.isEmpty
                                ? const Text(
                                    'Type Your Name',
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  )
                                : const Text(
                                    'Type Your Partner\'s Name',
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            )),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    child: heart ? const Loading() : null,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xffffd700),
        child: Text(
          'Mokirosoft v1.0.6',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue[800],
            backgroundColor: const Color(0xffffd700),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  animatedtext() {
    return AnimatedTextKit(
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
          'Sibling',
          textStyle: style_ss,
          //duration: Duration(milliseconds: 500),
        ),
        FadeAnimatedText(
          'Everything',
          textStyle: style4,
          duration: const Duration(milliseconds: 5000),
        ),
      ],
      onTap: () {
        launch(
            "https://medium.com/@ritwika285/how-to-play-flames-game-890edc7bf3d");
      },
    );
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
