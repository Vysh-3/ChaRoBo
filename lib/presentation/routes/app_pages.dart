import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/chatbot_controller.dart';
import '../controllers/splash_controller.dart';
import '../screens/chatbot_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/welcome_user_screen.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';

class AppRoutes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const login = '/login';
  static const signup = '/signup';
  static const welcomeUser = '/welcome_user';
  static const chatbot = '/chatbot';

  static final pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(AuthRepository());
        Get.put(LoginUseCase(Get.find<AuthRepository>()), permanent: true); // Singleton
        Get.put(SignupUseCase(Get.find<AuthRepository>()), permanent: true); // Singleton
        Get.put(SplashController());
        Get.put(AuthController(Get.find<LoginUseCase>(), Get.find<SignupUseCase>()), permanent: true); // Singleton
      }),
    ),
    GetPage(
      name: welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        // Reuse existing singletons
        Get.put(AuthRepository(), permanent: false); // Optional, if needed per route
      }),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() {
        // Reuse existing singletons
        Get.put(AuthRepository(), permanent: false); // Optional, if needed per route
      }),
    ),
    GetPage(
      name: welcomeUser,
      page: () => const WelcomeUserScreen(),
      binding: BindingsBuilder(() {
        // No need to put AuthController, reuse singleton
      }),
    ),
    GetPage(
      name: chatbot,
      page: () => const ChatbotScreen(),
      binding: BindingsBuilder(() {
        Get.put(AuthRepository());
        Get.put(ChatbotController());
      }),
    ),
  ];
}