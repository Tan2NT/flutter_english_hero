import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  final int index;
  final String question;
  final List<String> choices;
  final void Function(int, String) answerHandler;

  const QuizView(
      {Key? key,
      required this.index,
      required this.question,
      required this.choices,
      required this.answerHandler})
      : super(key: key);

  @override
  State<QuizView> createState() => _QuizState();
}

class _QuizState extends State<QuizView> {
  String _selection = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${widget.index}.  ',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(widget.question,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 26,
                    ))
              ],
            ),
          ),
          Column(
            children: widget.choices.map((item) {
              //change index of choices array as you need
              return RadioListTile(
                groupValue: _selection,
                title: Text(item),
                value: item,
                activeColor: Colors.blue,
                onChanged: (val) {
                  widget.answerHandler(widget.index, val as String);
                  setState(() {
                    _selection = val;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
