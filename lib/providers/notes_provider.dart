import 'package:flutter/material.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => List.from(_notes);

  void addNote(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  void updateNote(String id, Note updatedNote) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = updatedNote.copyWith();
      notifyListeners();
    }
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  List<Note> getNotesBySearch(String query) {
    if (query.isEmpty) return _notes;
    return _notes.where((note) =>
      note.title.toLowerCase().contains(query.toLowerCase()) ||
      note.content.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Thêm dữ liệu mẫu
  void addSampleNotes() {
    _notes.addAll([
      Note(
        title: 'Chào mừng!',
        content: 'Đây là ghi chú đầu tiên của bạn. Hãy bắt đầu tạo các ghi chú mới!',
        colorValue: 0xFFBBDEFB,
      ),
      Note(
        title: 'Công việc cần làm',
        content: '- Mua sữa\n- Gọi điện cho bố mẹ\n- Hoàn thành bài tập Flutter',
        colorValue: 0xFFC8E6C9,
      ),
      Note(
        title: 'Ý tưởng sáng tạo',
        content: 'Một ý tưởng tuyệt vời cho ứng dụng di động mới...',
        colorValue: 0xFFFFF9C4,
      ),
    ]);
    notifyListeners();
  }
}