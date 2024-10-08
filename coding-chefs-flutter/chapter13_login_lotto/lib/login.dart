import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'widget/MyTextFied.dart';
import 'widget/MyContainer.dart';
import 'lottery_app.dart/lotto.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController(); //textField 데이터를 가져올 수 있음.
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double currentWidget = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Current width: ${currentWidget.toString()}",
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
                            hz: 4,
                            curve: Curves.easeInOutCubic,
                            duration: 1880.ms),
                    const SizedBox(height: 5),
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ).animate().fade(delay: 500.ms).slideX(begin: -2, end: 0),
                    const SizedBox(height: 25),
                    Mytextfied(
                            emailType: TextInputType.emailAddress, //이메일 주소 입력용
                            controller: emailController,
                            hintText: "Username",
                            obscureText: false)
                        .animate()
                        .fade()
                        .slideX(begin: -3, end: 0, duration: 900.ms),
                    const SizedBox(height: 25),
                    Mytextfied(
                            controller: passwordController,
                            hintText: "Password",
                            obscureText: true)
                        .animate()
                        .fade()
                        .slideX(begin: 3, end: 0, duration: 900.ms),
                    const SizedBox(height: 25),
                    //이메일 검증
                    GestureDetector(
                      onTap: () {
                        if (emailController.text == "email@email.com" &&
                            passwordController.text == "123456") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Lotto()));
                        } else if (emailController.text == "email@email.com" &&
                            passwordController.text != "123456") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("이메일을 확인하세요."),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        } else if (emailController.text != "email@email.com" &&
                            passwordController.text == "123456") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("비밀번호를 확인하세요."),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("로그인 정보를 확인하세요."),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                      child: const Mycontainer(
                        width: 120,
                        height: 50,
                        backgroundColor: Color.fromARGB(255, 177, 220, 255),
                        radius: 20,
                        icon: Icon(Icons.arrow_forward),
                      ).animate().fade(delay: 1000.ms),
                    ),
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
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Powered by gaeun',
                          style: TextStyle(fontSize: 11),
                        ),
                        const SizedBox(width: 10),
                        Mycontainer(
                                width: 50,
                                height: 50,
                                backgroundColor: Colors.grey[200],
                                imagePath: "images/profile.png",
                                radius: 20)
                            .animate()
                            .slideX(begin: 3, end: 0, duration: 300.ms)
                            .animate(
                                onPlay: (controller) => controller.repeat())
                            .shimmer(
                              delay: 1000.ms,
                              duration: 1800.ms,
                            ),
                        const SizedBox(width: 20),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
