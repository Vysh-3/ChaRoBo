import 'package:chatbot/presentation/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/login_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;

  AuthController(this.loginUseCase, this.signupUseCase);

  final email = ''.obs;
  final password = ''.obs;
  final name = ''.obs;
  final isLoading = false.obs;
  final rememberMe = false.obs;
  final isPasswordVisible = false.obs;

  // Load saved data on initialization
  @override
  void onInit() {
    super.onInit();
    _loadSavedData();
  }

  // Save data to local storage
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.value);
    await prefs.setString('email', email.value);
    await prefs.setString('password', password.value); // Store securely if needed
  }

  // Load data from local storage
  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
    password.value = prefs.getString('password') ?? '';
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  Future<void> login() async {
    isLoading.value = true;
    final result = await loginUseCase.execute(email.value, password.value);
    isLoading.value = false;
    if (result) {
      await _saveData(); // Save after successful login
      Get.offAllNamed(AppRoutes.chatbot);
    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }

  Future<void> signup() async {
    isLoading.value = true;
    final user = UserModel(
      name: name.value,
      email: email.value,
      password: password.value,
    );
    print('Signup name: ${name.value}'); // Debug print
    final result = await signupUseCase.execute(user);
    isLoading.value = false;
    if (result) {
      await _saveData(); // Save after successful signup
      Get.offAllNamed(AppRoutes.welcomeUser);
    } else {
      Get.snackbar('Error', 'Signup failed');
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}