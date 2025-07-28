import 'package:flutter/material.dart';

void main() {
  runApp(TaroReaderApp());
}

class TaroReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '타로 리더',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainScreen(),
    );
  }
}

// 1. 메인 화면
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('타로 리더')),
      body: Center(
        child: ElevatedButton(
          child: Text('타로 뽑기 시작'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardSelectionScreen()),
            );
          },
        ),
      ),
    );
  }
}

// 2. 카드 선택 화면 (임시 UI)
class CardSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: 카드 선택 UI 구현
    return Scaffold(
      appBar: AppBar(title: Text('카드 선택')),
      body: Center(
        child: ElevatedButton(
          child: Text('카드 3장 선택 완료 (임시)'),
          onPressed: () {
            // 임시로 카드 3장 전달
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(selectedCards: [
                  {'name': 'The Fool', 'keywords': ['새로운 시작'], 'meaning': '새로운 출발'},
                  {'name': 'The Magician', 'keywords': ['능력'], 'meaning': '능력 발휘'},
                  {'name': 'The High Priestess', 'keywords': ['직관'], 'meaning': '직관적 판단'},
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}

// 3. 분석 확인 화면
class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedCards;

  ResultScreen({required this.selectedCards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('분석 결과')),
      body: ListView.builder(
        itemCount: selectedCards.length,
        itemBuilder: (context, index) {
          final card = selectedCards[index];
          return Card(
            child: ListTile(
              title: Text(card['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('키워드: ${card['keywords'].join(", ")}'),
                  Text('의미: ${card['meaning']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
