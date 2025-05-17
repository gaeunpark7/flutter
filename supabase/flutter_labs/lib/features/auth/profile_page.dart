import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/main_page.dart';
import 'package:flutter_labs/features/auth/login_page.dart';
import 'package:flutter_labs/shared/component/my_textform.dart';
import 'package:flutter_labs/shared/constants/my_text_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final nicController = TextEditingController();
  final introController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _redirectBasedOnProfileStatus();
  }

  /// 로그인 여부, 프로필 작성 여부
  Future<void> _redirectBasedOnProfileStatus() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
      return;
    }

    try {
      final profile =
          await supabase
              .from('users')
              .select('nickname')
              .eq('id', user.id)
              .maybeSingle();

      if (profile == null ||
          profile['nickname'] == null ||
          profile['nickname'].toString().trim().isEmpty) {
        // 프로필 미작성 상태 - 페이지 유지
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('사용자 정보를 불러오지 못했습니다.')));
    }
  }

  /// 갤러리 이미지 선택
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  /// Supabase Storage 이미지 업로드
  Future<String?> _uploadImageToSupabase(String userId) async {
    try {
      if (_image == null) return null;

      final fileBytes = await _image!.readAsBytes();
      final fileName = '$userId.jpg';

      await supabase.storage
          .from('profile-images')
          .uploadBinary(
            fileName,
            fileBytes,
            fileOptions: const FileOptions(upsert: true),
          );

      return supabase.storage.from('profile-images').getPublicUrl(fileName);
    } catch (e) {
      print("이미지 업로드 실패: $e");
      return null;
    }
  }

  /// 프로필 이미지 Supabase에 저장
  Future<void> _submitProfile() async {
    final user = supabase.auth.currentUser;
    final userId = supabase.auth.currentUser?.id;
    final email = user?.email;

    if (userId == null) return;

    final nickname = nicController.text.trim();
    if (nickname.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("닉네임을 입력해주세요")));
      return;
    }

    try {
      final imageUrl = await _uploadImageToSupabase(userId);

      final response = await supabase.from('users').upsert({
        'id': userId,
        'email': email,
        'nickname': nicController.text.trim(),
        'bio': introController.text.trim(),
        'profile_image': imageUrl,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("프로필 등록 실패:$e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.15),
                  _buildProfileImage(),
                  const SizedBox(height: 30),
                  MyTextform(
                    txtController: nicController,
                    title: "닉네임",
                    maxLength: 10,
                  ),
                  _buildIntroTextField(),
                  const SizedBox(height: 10),
                  _buildStartButton(),
                  SizedBox(height: screenHeight * 0.15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 프로필 사진
  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          backgroundColor: _image == null ? Colors.blueGrey : null,
          child:
              _image == null
                  ? const Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
        ),
        GestureDetector(
          onTap: _pickImage,
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Color.fromARGB(255, 150, 208, 255),
            child: Icon(Icons.camera_alt, color: Colors.white),
          ),
        ),
      ],
    );
  }

  /// 소개 입력필드
  Widget _buildIntroTextField() {
    return TextFormField(
      controller: introController,
      maxLines: 5,
      maxLength: 50,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 64, 175, 206)),
        ),
        hintText: "소개",
      ),
    );
  }

  /// 시작하기 버튼
  Widget _buildStartButton() {
    return SizedBox(
      height: 47,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: _submitProfile,
        child: Text("시작하기", style: MyTextStyle.title),
      ),
    );
  }
}
