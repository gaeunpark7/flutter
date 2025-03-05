import 'package:ex02_16/dto/todo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

    // lst.add(Todo("청소"));
    // lst.add(Todo("공부"));
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
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("todo").snapshots(),
                  builder: (context, snapshot) {
                    //데이터가 없을 때
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    var docs = snapshot.data!.docs;

                    print("92: $docs");

                    return ListView(
                      children: buildTodoList(docs),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> buildTodoList(lst) {
    for (var item in lst) {
      print("117: ${item['title']}");
    }
    // return Container();
    return lst.map<Widget>((e) {
      return Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              // print("100: ${['title']} 클릭");
              changeDone(e); //완료 여부
              setState(() {});
            },
            child: Text(e['title'],
                style: e['isDone']
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

  void changeDone(Todo e) {
    // e.isDone = !e.isDone;
  }

  //추가
  addTodo(String todo) {
    if (todo.trim() != "") {
      //공백제거
      // lst.add(Todo(todo));
    }
  }

  //삭제
  deleteTodo(Todo item) {
    // lst.remove(item);
  }
}
