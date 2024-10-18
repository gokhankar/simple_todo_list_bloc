// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String name;
  final String? text;
  final bool? isDone;
  final DateTime? createdAt;

  Todo({required this.name, this.text, this.isDone, this.createdAt});

  @override
  String toString() {
    return 'Todo(name: $name, text: $text, isDone: $isDone, createdAt: $createdAt)';
  }
}
