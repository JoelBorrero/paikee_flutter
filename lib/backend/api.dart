import 'package:dio/dio.dart';

import 'package:paikee/backend/models/chat_list.dart';

final dio = Dio();
const host = 'https://my-json-server.typicode.com/joelborrero/myjsonserver';

Future<ChatListResponse> getChats() async {
  final response = await dio.get('$host/chats');
  return ChatListResponse.fromJson(response.data);
}
