import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum GENDER { MAN, WOMEN }

List<String> lstMenu = ["짜장", "짬뽕", "볶음밥"];
String strSelecteMenu = "짜장";

class _MyHomePageState extends State<MyHomePage> {
  GENDER gender = GENDER.MAN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("45: 남자클릭");
                gender = GENDER.MAN;
                setState(() {});
              },
              child: ListTile(
                title: const Text("남자"),
                leading: Radio(
                  value: GENDER.MAN,
                  groupValue: gender,
                  onChanged: (value) {
                    print("49: $value");
                    setState(() {
                      gender = value ?? GENDER.MAN;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("여자"),
              leading: Radio(
                value: GENDER.WOMEN,
                groupValue: gender,
                onChanged: (value) {
                  print("59: $value");
                  setState(() {
                    gender = value ?? GENDER.MAN;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            RadioListTile(
              title: const Text("남자"),
              value: GENDER.MAN,
              groupValue: gender,
              onChanged: (value) {
                gender = value ?? GENDER.MAN;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("여자"),
              value: GENDER.WOMEN,
              groupValue: gender,
              onChanged: (value) {
                gender = value ?? GENDER.MAN;
                setState(() {});
              },
            ),
            const SizedBox(height: 40),
            DropdownButton(
                value: strSelecteMenu,
                items: lstMenu
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  print("105: $value");
                  strSelecteMenu = value ?? lstMenu[0];
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
