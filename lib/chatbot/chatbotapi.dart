import 'dart:convert';
import 'package:http/http.dart' as http;

class Responce {
    Future<Map<String, dynamic>> sendMessageToChatGPT(message) async {
    final apiKey = 'PLACE YOUR API KEY HERE';
    final endpoint = 'https://api.openai.com/v1/chat/completions';

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': '''You are Agriculture specialist and only answers the questions abount agriculture field.
          you should follow the instructions given below
          1.answer only agriculture questions else don't answer and politely ask to provide questions related to agriculture field.
          2.answer must be shorter in beetween 10 to 80 words and must be related to agriculture field.'''},
          {'role': 'user', 'content': message}
        ],
      },),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to send message to ChatGPT');
    }
  }
}

