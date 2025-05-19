import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/main_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  Future<void> _addPost() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("로그인이 필요합니다.")));
      return;
    }

    try {
      final response = await supabase.from('posts').insert({
        'title': titleController.text,
        'content': descriptionController.text,
        'user_id': user.id,
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("게시물이 성공적으로 추가되었습니다.")));

      print(response);
      //입력필드 초기화
      titleController.clear();
      descriptionController.clear();
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("에러: $e")));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("글 쓰기"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (formkey.currentState!.validate()) {
                print("글 작성 완료");
                _addPost();
              }
            },
          ),
        ],
        //테두리
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // 테두리 높이
          child: Container(color: Colors.grey, height: 1.0), //테두리 두께
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildTextField(titleController, "제목"),
                Divider(),
                _buildTextField(descriptionController, "내용", maxlegth: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController ctl,
    String hint, {
    double? verticalPadding,
    double? horizontalPadding,
    int? maxlegth,
  }) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hint을 입력하세요.";
        }
        return null;
      },
      controller: ctl,
      maxLines: hint == "내용" ? null : 1,
      maxLength: maxlegth,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0.0,
          horizontal: horizontalPadding ?? 0.0,
        ),
        hintText: hint,
      ),
    );
  }
}
