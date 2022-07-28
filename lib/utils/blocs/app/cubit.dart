import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:todo/utils/blocs/app/states.dart';

import '../../../model/task.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  late Database database;

  void initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'tasks.db');

    debugPrint('AppDatabaseInitialized');

    openAppDatabase(
      path: path,
    );

    emit(AppDatabaseInitialized());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, date TEXT, startTime TEXT, endTime TEXT, isCompleted INTEGER, isFavorite INTEGER, remind TEXT, repeat TEXT )',
        );

        debugPrint('Table Created');
      },
      onOpen: (Database db) {
        debugPrint('AppDatabaseOpened');
        database = db;

        getTasksData();
      },
    );
  }

  //TextEditingController usernameController = TextEditingController();

  void insertTaskData({Task? task}) async{
    // if(selectedTask.isNotEmpty) {
    //   updateTaskData();
    //   return;
    // }
    int returnNumber = await database.insert('tasks', task!.toJson());
    print(returnNumber);
    if(returnNumber != 0){
      debugPrint('Task Data Inserted');

     // usernameController.clear();
      getTasksData();

      emit(AppDatabaseTaskCreated());
    }
    /*database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(name) VALUES("${usernameController.text}")');
    }).then((value) {
      debugPrint('Task Data Inserted');

      usernameController.clear();
      getTasksData();

      emit(AppDatabaseTaskCreated());
    });*/
  }

  List<Task> tasks = [];

  void getTasksData() async {
    emit(AppDatabaseLoading());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      debugPrint('Tasks Data Fetched');
      debugPrint(value.length.toString());
      //tasks = value;
      tasks = value.map((task) => Task.fromJson(task)).toList();
       for(int i=0; i<tasks.length; i++){
         debugPrint(tasks[i].toJson().toString());
       }

      emit(AppDatabaseTasks());
    });
  }


  void updateTaskStatus({
    required int isCompleted,
    required int id,
  }) async{
    database.rawUpdate(
      'UPDATE tasks SET isCompleted = ? WHERE id = ?',
      [isCompleted, id],
    ).then((value) {
      //getData(database);
      getTasksData();
      emit(AppDatabaseTasksStatus());
    });
  }

  void updateTaskFavorite({
    required int isFavorite,
    required int id,
  }) async{
    database.rawUpdate(
      'UPDATE tasks SET isFavorite = ? WHERE id = ?',
      [isFavorite, id],
    ).then((value) {
      //getData(database);
      getTasksData();
      emit(AppDatabaseTasksStatus());
    });
  }

  void deleteData({
    required int id,
  }) async{
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value) {
      getTasksData();
      emit(AppDatabaseTasksDeleted());
    });
  }
  void updateTaskData({required Task task}) async {

    database.update('tasks', task.toJson());
    debugPrint('Task Data Updated');
    getTasksData();
    /*database.rawUpdate(
        'UPDATE tasks SET name = ? WHERE id = ${selectedTask['id']}', [
      (usernameController.text),
    ]).then((value) {
      selectedTask = {};
      usernameController.clear();

      debugPrint('Task Data Updated');
      getTasksData();
    });
    */
  }
}