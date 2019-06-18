


## Overview

This is the code for [this](https://youtu.be/b8xlCNzkX5w) video on Youtube by Siraj Raval on "How to Build a Healthcare Startup". The app uses PoseNet to detect human poses and a text to speech engine to speak to you. This emulates the role of a Yoga instructor! This code is unfinished, but meant to give you a starting point and guide so that you can build a profitable business using it or a similar idea. 

## Dependencies

All of these can be downloaded in a single command, see below. 

- PoseNet Model 
- Tensorflow Lite
- Stripe
- RazorPay
- Flutter Text to Speech

## Instructions

First install [Flutter](https://flutter.dev/docs/get-started/install). 

After download, from command line run this to install the dependencies
```
flutter packages get
```
Then run this command to run the app

```
flutter run
```
Alternatively you can open the app as a new flutter project in Android Studio after installing the Flutter plugin. See the video for instructions on how to do that. 

## TODO - please make a PR if you fix any of these

- Firebase is integrated, but it still needs to be properly wired up to the login and signup pages.
- Stripe and RazorPay are integrated, but each still need to be wired up to the Credit/Debit Card view i created.
- Generate some text everytime a pose is detected, not just on startup.
- Make the personal 0/10 score some meaningful metric, store it in Firebase.
- PoseNet is integrated, but still needs to be replaced by YogaNet. 

## Wait what's YogaNet?

[this](https://github.com/smellslikeml/YogAI) is YogaNet. This person retrained a neural network to detect yoga poses and outputted the result as a TFLite file in their /models folder. Notice how in this flutter app, there is space to import TF Lite models. Integrate the Yoga Model into the app by replacing the existing posenet model. 

## Credits

Thanks to [shaqian](https://github.com/shaqian/flutter_realtime_detection) for his starter code. 
