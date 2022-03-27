import 'package:final_620710340/models/api_result.dart';
import 'package:final_620710340/models/quiz_item.dart';
import 'package:final_620710340/pages/quiz_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizeDetalis extends StatefulWidget {
  const QuizeDetalis({Key? key}) : super(key: key);

  @override
  State<QuizeDetalis> createState() => _QuizeDetalisState();
}

class _QuizeDetalisState extends State<QuizeDetalis> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: QuizData.list.length,
              itemBuilder: (context, index) => _build(context, index),
            ),
            if (_isLoading) const Center(),
          ],
        ),
      ),
    );
  }

  _loadQuiz() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var response = await http.get(url, headers: {'id': '620710340'});
    setState(() {
      _isLoading = false;
    });

    var json = jsonDecode(response.body);
    var apiResult = ApiResult.fromJson(json);

    setState(() {
      QuizData.list = apiResult.data
          .map<guizItem>((item) => guizItem.fromJson(item))
          .toList();
    });
  }

  Widget _build(BuildContext context, int index) {
    var guizItem = QuizData.list[index];

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Image.network(
                  guizItem.image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
