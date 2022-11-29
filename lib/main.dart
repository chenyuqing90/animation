import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Offset offset = Offset.zero;

  void _slideUp() {
    setState(() => offset -= const Offset(0, 3));
  }

  void _slideDown() {
    setState(() => offset += const Offset(0, 80));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(180),
          child: AnimatedSlide(
            offset: offset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: const FlutterLogo(),
          ),
        ),
        ElevatedButton(
          onPressed: _slideUp,
          child: const Text('Start'),
        ),
      ],
    );
  }
}
