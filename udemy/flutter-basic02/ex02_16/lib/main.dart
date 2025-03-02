import 'package:ex02_16/dto/todo.dart';
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
      debugShowCheckedModeBanner: false,
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

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> lst = [];

  var txtTodo = TextEditingController();

  @override
  void initState() {
    super.initState();

    lst.add(Todo("청소"));
    lst.add(Todo("공부"));
  }

  @override
  void dispose() {
    txtTodo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("To do list")),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txtTodo,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTodo(txtTodo.text);
                        txtTodo.text = ""; //입력했을 때 textField값 없앰.
                        setState(() {});
                      },
                      child: const Text("저장"))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: buildTodoList(),
                ),
              )
            ],
          ),
        ));
  }

  buildTodoList() {
    return lst.map((e) {
      return Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              print("100: ${e.title} 클릭");
              e.isDone = !e.isDone; //완료 여부
              setState(() {});
            },
            child: Text(e.title,
                style: e.isDone
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontStyle: FontStyle.italic)
                    : null),
          )),
          IconButton(
              onPressed: () {
                print("103:${e.title} delete");
                deleteTodo(e); //지우기
                setState(() {});
              },
              icon: const Icon(Icons.delete_forever, color: Colors.red))
        ],
      );
    }).toList();
  }

  //추가
  addTodo(String todo) {
    lst.add(Todo(todo));
  }

  //삭제
  deleteTodo(Todo item) {
    lst.remove(item);
  }
}
