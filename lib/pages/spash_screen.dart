import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomPaint(
          painter: ShapesPainter(),
          child: Container(
            height: 800,
          ),
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.white;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    var gradient_1 = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topLeft,
      colors: [
        Colors.white,
        Colors.grey[300],
      ],
      stops: [0.4, 1.0],
    );
    paint.shader = gradient_1.createShader(rect);
    canvas.drawArc(Rect.fromCenter(center: Offset(50, size.height-250), height: size.height/2, width: size.width+150),
        3.14, 3.14, false, paint);

    var gradient_2 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        Colors.white,
        Colors.grey[200],
      ],
      stops: [0.5, 1.0],
    );
    paint.shader = gradient_2.createShader(rect);
    canvas.drawArc(Rect.fromCenter(center: Offset(size.width-100, size.height-350), height: size.height/2, width: size.width),
        -3.14, -3.14, false, paint);

    var gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [
        Colors.white,
        Colors.grey[200],
      ],
      stops: [0, 1.0],
    );
    paint.shader = gradient.createShader(rect);
    canvas.drawCircle(Offset(20, -20), size.height/2-50, paint);
////////////////////////////////////////

    //ui.Image image = loadUiImage('assests/logo.png');



/////////////////////////////////////////
    final textStyle = ui.TextStyle(
      color: Colors.black,
      fontFamily: 'Rushink',
      fontSize: 70,
    );

    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText('Voyobee');
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
//////////////////////////////////////////
    final textStyle_1 = ui.TextStyle(
      color: Colors.grey,
      fontSize: 25,
    );

    final paragraphStyle_1 = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder_1 = ui.ParagraphBuilder(paragraphStyle_1)
      ..pushStyle(textStyle_1)
      ..addText('Unknown to the known');
    final constraints_1 = ui.ParagraphConstraints(width: 300);
    final paragraph_1 = paragraphBuilder_1.build();
    paragraph_1.layout(constraints_1);
///////////////////////////////////////////
    final offset = Offset(size.width/2-100, size.height/2+20);
    final offset_1 = Offset(size.width/2-120, size.height/2+130);
    canvas.drawParagraph(paragraph, offset);
    canvas.drawParagraph(paragraph_1, offset_1);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  Future<ui.Image> loadUiImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}