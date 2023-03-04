import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

void jailBrokenCheck() async{
  if(kDebugMode){
    final jailBroken = await FlutterJailbreakDetection.jailbroken;
    bool developerMode = await FlutterJailbreakDetection.developerMode;
    if(jailBroken && developerMode){
      exit(0);
    }
  }
}