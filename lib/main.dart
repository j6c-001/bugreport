import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/widgets.dart';


/*
 Set size below to 540 or above to reproduce.
 Lower values work (text does not render for 537, 538, 539. 540 crashes with


CanvasKit threw an exception while laying out the paragraph. The font was "null". Exception:
RuntimeError: null function or function signature mismatch
CanvasKit threw an exception while laying out the paragraph. The font was "null". Exception:
RuntimeError: null function or function signature mismatch

*/


const size = 540;

const vertexIndex = 8;
const indiceIndex= 12;
const colorIndex = 4;

Float32List vertices = Float32List(2*size);
Uint16List indices =  Uint16List(3*size);
Int32List colors = Int32List(size);
void main() {
    final vs = Vertices.raw(VertexMode.triangles,
        Float32List.sublistView(vertices,0, vertexIndex),
        indices: Uint16List.sublistView(indices, 0, indiceIndex),
        colors:  Int32List.sublistView(colors, 0, colorIndex) // *no error when this line is commented out.
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(color: const Color(0xFFFF0000), builder: (CTX, W)=> Center(child: Column(
        children: const [ Text('There is no button') ])));
  }
}
