import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera.dart';
import 'bndbox.dart';
import 'models.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:flutter_tts/flutter_tts.dart';



Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

class ThirdRoute extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  loadModel() async {
    String res;
    switch (_model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      case yoganet:
        res = await Tflite.loadModel(
            model: "assets/model.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    print(res);
  }

  onSelect(model) {

      _model = model;

    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {

      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;

  }


  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = new FlutterTts();
    flutterTts.speak("Welcome Back Siraj. Are you ready for your session?");
    return Scaffold(
      backgroundColor: Color(0xff7F84BE),

      appBar: AppBar(
        title: Text("Dashboard"),
      ),


      body: Center(

      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          "Current level: 0/10",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, fontFamily: "Arial"),
        ),
    Image.asset(
    'assets/lola.gif',
    )  , Text(

          "Welcome back, Siraj.",
          textAlign: TextAlign.center,

          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, fontFamily: "Arial"),
        ),

          ButtonTheme(
              minWidth: 180.0,
              height: 50.0,
        child:RaisedButton(
            child: const Text("Begin"), color: Colors.deepPurpleAccent,
            onPressed: () => onSelect(posenet)


        )),
        SizedBox(height: 10),


        ButtonTheme(
          minWidth: 180.0,
          height: 50.0,




            child: RaisedButton(
              child: const Text("Enroll"), color: Colors.deepPurpleAccent,
              onPressed: ()
              {
                //I integrated 2 text to speech engines
                FlutterTts flutterTts = new FlutterTts();
                flutterTts.speak("Hello World");

                VoiceController controller = FlutterTextToSpeech.instance.voiceController();
                controller.init().then((_) {
                  controller.speak(
                      "testing audio output", VoiceControllerOptions(delay: 5));
                });
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                        backgroundColor: Color(0xff7F84BE),
                        title: new Text("Monthly Fee: 100 USD"),
                      content:

                      new Container(
                        width: 300.0,

                        child:

                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/lola.gif',
                              ),

                        TextFormField(
                          decoration: InputDecoration(

                              labelText: 'Card #'
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                              labelText: 'CVC'
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(

                              labelText: 'MM/YY'
                          ),
                        ),
                              RaisedButton(
                                  child: const Text("Enroll"), color: Colors.deepPurpleAccent,
                                  onPressed: ()
                                  {
                                    Navigator.pop(context);
                                  }


                              )

                        ])


                      )

                    )
                );
              //  Navigator.pop(context);
              }
          ),
        ),

      ])));}}


class SecondRoute extends StatelessWidget {
  @override

 // firebase login/signup code
//  _validateAndSubmit() async {
//    setState(() {
//      _errorMessage = "";
//      _isLoading = true;
//    });
//    if (_validateAndSave()) {
//      String userId = "";
//      try {
//        if (_formMode == FormMode.LOGIN) {
//          userId = await widget.auth.signIn(_email, _password);
//          print('Signed in: $userId');
//        } else {
//          userId = await widget.auth.signUp(_email, _password);
//          print('Signed up user: $userId');
//        }
//        if (userId.length > 0 && userId != null) {
//          widget.onSignedIn();
//        }
//      } catch (e) {
//        print('Error: $e');
//        setState(() {
//          _isLoading = false;
//          if (_isIos) {
//            _errorMessage = e.details;
//          } else
//            _errorMessage = e.message;
//        });
//      }
//    }
//  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7F84BE),

      appBar: AppBar(
        title: Text("Signup"),
      ),


      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/lola.gif',
            ),
            new Container(
              width: 300.0,

              child:TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),

            ),
            new Container(
              width: 300.0,

              child:TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
              ),

            ),
              SizedBox(height: 10),



          SizedBox(height: 10),
            ButtonTheme(
              minWidth: 180.0,
              height: 50.0,

              child: RaisedButton(
                  child: const Text("Sign up"), color: Colors.deepPurpleAccent,
                  onPressed: ()
                    {
                          Navigator.pop(context);
                      }

              ),
            ),

            SizedBox(height: 10),
            ButtonTheme(
              minWidth: 180.0,
              height: 50.0,

              child: RaisedButton(
                  child: const Text("Go Back"), color: Colors.deepPurpleAccent,
                  onPressed: ()
                     {
                       Navigator.pop(context);
                     }
              ),
            ),

          ]),

      ),

    );

  }
}

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    switch (_model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yoganet.tflite",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      case yoganet:
        res = await Tflite.loadModel(
            model: "assets/model.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;



    return Scaffold(


      backgroundColor: Color(0xff7F84BE),
      body: _model == ""
          ? Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/lola.gif',
                  ),
                  Text(
                    "Macy",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, fontFamily: "Arial"),
                  ),


        new Container(
          width: 300.0,

      child:TextFormField(
        decoration: InputDecoration(
            labelText: 'Username'
        ),
      ),

        ),
        new Container(
          width: 300.0,

          child:
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                  ),

        ),        SizedBox(height: 10),

        ButtonTheme(
          minWidth: 180.0,
          height: 50.0,
          child: RaisedButton(

            child: const Text("Login"), color: Colors.deepPurpleAccent,
            onPressed: () =>  Navigator.push(

              context,
              MaterialPageRoute(builder: (context) => ThirdRoute()),
            )
          ),
        ),
                  SizedBox(height: 10),
                  ButtonTheme(
                    minWidth: 180.0,
                    height: 50.0,

                    child: RaisedButton(
                      child: const Text("Sign up"), color: Colors.deepPurpleAccent,
                      onPressed: () =>

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute()),
                        )
                    ),
                  ),

                  RaisedButton(
                    child: const Text(posenet),
                    onPressed: () => onSelect(posenet),
                  ),

                ],
              ),
            )



          : Stack(
              children: [
                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                BndBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model),
              ],
            ),
    );
  }
}
