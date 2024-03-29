import 'package:flutter/material.dart';
import 'package:metbuy/const/const.dart';
import 'package:metbuy/views/messages_screen/components/chat_bubble.dart';
import 'package:metbuy/views/widgets/text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: chat, size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return chatBuddle();
                }),

              ),
            ),
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter Message",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black), // changed from black to Colors.black
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black), // changed from black to Colors.black
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: darkGrey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
