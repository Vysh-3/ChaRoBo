import 'package:chatbot/data/repositories/auth_repository.dart';
import 'package:chatbot/presentation/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../data/models/message_model.dart';
import 'package:chatbot/data/repositories/chatbot_response.dart';

class ChatbotController extends GetxController {
  final messages = <MessageModel>[].obs;
  final messageText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    messages.add(MessageModel(text: 'Hello! I’m ChaRoBo 😄 How can I help you?', isUser: false));
  }

  void sendMessage([String? predefinedMessage]) {
    final message = predefinedMessage ?? messageText.value;
    if (message.isEmpty) return;
    messages.add(MessageModel(text: message, isUser: true));
    final botResponse = ChatbotResponses.getBotResponse(message);
    messages.add(MessageModel(text: botResponse, isUser: false));
    messageText.value = '';
  }

  Future<void> logout() async {
    await Get.find<AuthRepository>().logout();
    Get.offAllNamed(AppRoutes.login);
  }
}
