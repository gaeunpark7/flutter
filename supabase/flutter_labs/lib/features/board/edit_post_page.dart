import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditPostPage extends StatefulWidget {
  final Map<String, dynamic> post;
  const EditPostPage({super.key, required this.post});

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final formkey = GlobalKey<FormState>();
  var titleCtr = TextEditingController();
  var contentCtr = TextEditingController();

  Future<void> _editPost() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("로그인이 필요합니다.")));
      return;
    }

    try {
      final response = await supabase
          .from('posts')
          .update({
            'title': titleCtr.text,
            'content': contentCtr.text,
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', widget.post['id']); //게시물 id로 수정

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("게시물이 성공적으로 수정되었습니다.")));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("에러: $e")));
    }
  }

  @override
  void initState() {
    super.initState();
    //사용자가 작성한 제목과 내용 불러옴.
    final post = widget.post;
    titleCtr.text = post['title'] ?? '제목 불러오기 실패';
    contentCtr.text = post['content'] ?? '내용 불러오기 실패';
  }

  @override
  void dispose() {
    super.dispose();
    titleCtr.dispose();
    contentCtr.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("게시물 수정"),
        actions: [
          IconButton(
            onPressed: () {
              _editPost();
            },
            icon: Icon(Icons.check),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildTextField(titleCtr, "제목"),
                Divider(),
                _buildTextField(contentCtr, "내용", maxlegth: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
