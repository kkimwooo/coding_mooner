class History {
  String question;
  String answer;
  String date;

  History(this.date, this.question, this.answer);

  factory History.fromJon(Map<String, dynamic> json) {
    return History(json['date'], json['question'], json['answer']);
  }
}
