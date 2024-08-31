import 'package:chapter11_login_app/widget/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'widget/MyTextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final double currentWidth =
        MediaQuery.of(context).size.width; //Screen 너비 반환
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                //Screen의 너비를 출력해주는 Text 위젯 추가.
                "Current width: ${currentWidth.toString()}",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              Image.asset("images/profile.png", width: 150, height: 150)
                  .animate()
                  .fade()
                  .slideY(begin: -3, end: 0)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(
                      hz: 4, curve: Curves.easeInOutCubic, duration: 1880.ms),
              const SizedBox(height: 5),
              Text(
                "Welcome back!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ).animate().fade(delay: 500.ms).slideX(begin: -2, end: 0),
              const SizedBox(height: 5),
              Text(
                "Sign in to continue",
                style: TextStyle(color: Colors.grey[700]),
              ).animate().fade(delay: 500.ms).slideX(begin: 2, end: 0),
              const SizedBox(height: 25),
              const Mytextfield(hintText: 'Username', obscureText: false)
                  .animate()
                  .fade()
                  .slideX(begin: -3, end: 0, duration: 900.ms),
              const SizedBox(height: 25),
              const Mytextfield(hintText: "Password", obscureText: true)
                  .animate()
                  .fade()
                  .slideX(begin: 3, end: 0, duration: 900.ms),
              const SizedBox(height: 25),
              const Mycontainer(
                width: 120,
                height: 50,
                backgroundColor: Color.fromARGB(255, 177, 220, 255),
                radius: 20,
                icon: Icon(Icons.arrow_forward),
              ).animate().fade(delay: 1000.ms),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "회원이 아니신가요?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "회원가입",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Powered by gaeun",
                    style: TextStyle(fontSize: 11),
                  ),
                  const SizedBox(width: 10), // 텍스트와 이미지 사이의 간격
                  Mycontainer(
                          width: 50,
                          height: 50,
                          backgroundColor: Colors.grey[200],
                          imagePath: "images/profile.png",
                          radius: 20)
                      .animate()
                      .slideX(begin: 3, end: 0, duration: 300.ms)
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        delay: 1000.ms,
                        duration: 1800.ms,
                      ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
