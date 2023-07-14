import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    setState(() {
      counter = counter + 1;
    }); //State 클래스에게 데이터가 변경되었다고 알리는 함수
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeText() : const Text('nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeText extends StatefulWidget {
  const MyLargeText({
    super.key,
  });

  @override
  State<MyLargeText> createState() => _MyLargeTextState();
}

class _MyLargeTextState extends State<MyLargeText> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  } // 부모요소에 의존하는 데이터를 초기화해야 하는 경우에 사용, 대부분 위 방식으로 사용.

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  } // 위젯이 스크린에서 제거될 때 호출되는 메서드,

  @override
  Widget build(BuildContext context) {
    return Text(
      'Click Count',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
