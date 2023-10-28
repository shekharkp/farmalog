
import 'package:flutter/material.dart';
import 'chatbotapi.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  List<Message> msg = [Message('r', "Hello Shekhar!!!"),];
  TextEditingController _chatbot_controller = TextEditingController();

  void sendMessage(String message)
  {
    msg.add(Message("s", message),);
  }

  void responceMessage(String message) async
  {
    Responce rp = Responce();
    try{
      msg.add(Message('r', 'Loading...'));
      final respo = await rp.sendMessageToChatGPT(message);
      String respor = respo['choices'][0]['message']['content'];
      setState(() {
        msg.removeLast();
        msg.add(Message("r", respor));
      });

    }
    catch(e)
    {
      setState(() {
        msg.removeLast();
        msg.add(Message('r', 'Check your connection.'),);
      });


    }

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffe4e2e5),
        appBar: AppBar(
          backgroundColor: Color(0xffe4e2e5),
          automaticallyImplyLeading: false,
          title: Text('Chatbot',style: TextStyle(color: Color(0xFF333c3a),fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
          SingleChildScrollView(
            reverse: true,
            child: AnimatedList(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              initialItemCount: msg.length,
              key: UniqueKey(),
              padding: EdgeInsets.only(top: 10, bottom: 70),
              itemBuilder: (context, index,animation) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                  child: Align(
                    alignment: msg[index].message_type == "r"
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: msg[index].message_type == "r"
                            ? Color(0xFFc4cfdd)
                            : Color(0xFF333c3a),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        msg[index].message,
                        style: msg[index].message_type == 'r'?TextStyle(color: Color(0xFF333c3a)):TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        controller: _chatbot_controller,
                        cursorColor: Colors.grey,
                        cursorHeight: 15,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter Massage",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(fontSize: 15, color: Color(0xFF333c3a)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xFFc4cfdd),
                    child: Icon(
                      Icons.send_rounded,
                      color: Color(0xFF333c3a),
                    ),
                    onPressed: () {
                      setState((){
                        sendMessage(_chatbot_controller.text);
                        responceMessage(_chatbot_controller.text);
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
        ),
      ),
    );
  }
}

class Message {
  String message_type;
  String message;
  Message(this.message_type, this.message);
}
