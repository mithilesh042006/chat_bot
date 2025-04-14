import 'package:bot_learning_app/api_key.dart';
import 'package:bot_learning_app/message.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> chatList = [];

  Future<void> process(String userMessage) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
    final prompt = userMessage;
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    chatList.add({"role": "gemini", "message": response.text ?? ""});
    setState(() {});
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "ChatMate",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return Message(
                  text: chatList[index]["message"] ?? "",
                  role: chatList[index]["role"] ?? "",
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: inputController,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 36, 36, 36),
                      filled: true,
                      hintText: "Type something",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      chatList.add(
                          {"role": "user", "message": inputController.text});
                      setState(() {});
                      process(inputController.text);
                      inputController.clear();
                      Future.delayed(Duration(milliseconds: 100), () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    },
                    icon: Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
