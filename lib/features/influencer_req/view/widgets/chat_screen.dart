import 'package:flutter/material.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/theme/app_text_styles.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hi', 'isMe': true, 'time': '9:12 PM'},
    {'text': 'How are you', 'isMe': false, 'time': '9:15 PM'},
    {'text': 'Fine! What\'s your email?', 'isMe': true, 'time': '9:16 PM'},
    {'text': 'christinapearson@gmail.com', 'isMe': false, 'time': '9:21 PM'},
    {'text': 'Good Night', 'isMe': true, 'time': '11:18 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlue,
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: ()=>Navigator.pop(context),color: Colors.white,),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),),
            const SizedBox(width: 10),
            Text('Debra Nguyen',style: AppTextStyles.poppinsBold15White,),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  text: _messages[index]['text'],
                  isMe: _messages[index]['isMe'],
                  time: _messages[index]['time'],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _messages.add({'text': _controller.text, 'isMe': true, 'time': '${DateTime.now().hour+1}:${DateTime.now().minute} ${DateTime.now().hour<12?'AM':'PM'}'});
                    _controller.clear();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  ChatBubble({required this.text, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: isMe ? AppColors.mainBlue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(text,style: TextStyle(color: isMe?Colors.white:Colors.black),),
        ),
        Padding(
          padding: EdgeInsets.only(right: isMe ? 8.0 : 0, left: isMe ? 0 : 8.0),
          child: Text(time, style: const TextStyle(fontSize: 12.0, color: Colors.grey,),),
        ),
      ],
    );
  }
}