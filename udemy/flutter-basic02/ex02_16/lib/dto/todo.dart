class Todo {
  //처리 완료
  bool isDone = false;

  //할일 제목
  String title = "";

  Todo(this.title, {this.isDone = false} //생략 가능
      );
}
