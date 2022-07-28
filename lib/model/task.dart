class Task {
  int? id;
  String? title;
  String? date;
  String? startTime;
  String? endTime;
  int? isCompleted;
  int? isFavorite;
  String? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.date,
    this.startTime,
    this.endTime,
    this.isCompleted,
    this.isFavorite,
    this.remind,
    this.repeat,
  });

  Task.fromJson(Map<String, dynamic> json){
    id  = json['id'];
    title = json['title'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isCompleted = json['isCompleted'];
    isFavorite = json['isFavorite'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String,dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['isCompleted'] = this.isCompleted;
    data['isFavorite'] = this.isFavorite;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    return data;
  }

}
