import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bug Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


/*
  Lower values work (text does not render for 537, 538, 539. 540 crashes with
CanvasKit threw an exception while laying out the paragraph. The font was "Segoe UI". Exception:
RuntimeError: null function or function signature mismatch
CanvasKit threw an exception while laying out the paragraph. The font was "null". Exception:
RuntimeError: null function or function signature mismatch
*/

const size = 540;
class _MyHomePageState extends State<MyHomePage> {


  Float32List vertices = Float32List(2*size);
  Uint16List indices =  Uint16List(3*size);
  Int32List colors = Int32List(size);

  final vertexIndex = 8;
  final indiceIndex= 12;
  final colorIndex = 4;

  _MyHomePageState() {

    final vs = Vertices.raw(VertexMode.triangles,
        Float32List.sublistView(vertices,0, vertexIndex),
        indices: Uint16List.sublistView(indices, 0, indiceIndex),
        colors:  Int32List.sublistView(colors, 0, colorIndex)
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'There is no button'
            ),
          ],
        ),
      )
    );
  }
}
