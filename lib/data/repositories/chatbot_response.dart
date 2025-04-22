class ChatbotResponses {
  static const Map<String, String> responses = {
    'hello': 'Hi there! How can I assist you?',
    'help': 'I’m here to help! What do you need?',
    'how are you?': 'I’m doing great, thanks for asking!',
    'bye': 'Goodbye! Come back soon!',
    'who are you?': 'I am ChaRoBo!', // New response
    'what can you do?': 'I can chat with you, answer questions, and have fun!', // New response
    'tell me a joke': 'Why did the robot go to school? To improve its "byte"!', // New response
    'thank you': 'You’re welcome! 😊', // New response
  };

  static const List<String> quickReplies = [
    'Hello',
    'Help',
    'How are you?',
    'Bye',
    'Who are you?', // New quick reply
    'What can you do?', // New quick reply
    'Tell me a joke', // New quick reply
    'Thank you', // New quick reply
  ];

  static String getBotResponse(String userMessage) {
    final normalizedMessage = userMessage.toLowerCase().trim();
    return responses[normalizedMessage] ?? 'I do not understand this: ${userMessage.toUpperCase()}';
  }
}