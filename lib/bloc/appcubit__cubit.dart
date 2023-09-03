import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icluppppp/bloc/appcubit__state.dart';
import 'package:sqflite/sqflite.dart';

class Appcubit extends Cubit<Parent> {
  Appcubit() : super(Intial());
  static Appcubit get(context) => BlocProvider.of(context);
  late Database data;
  bool passwordvisiablilty = false;
  bool passwordvisiablilty2 = false;
  bool checkemail = false;

  void createDatabase() {
    openDatabase(
      'DatabaseSection.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE user (id INTEGER PRIMARY KEY , name TEXT , email TEXT , phone INTEGER , password TEXT ,age INTEGER , height INTEGER)''').then(
                (value) {
              print("created");
            }).catchError((e) {
          print("Error nnnnn");
        });
      },
      onOpen: (db) {
        print("database opened");
      },
    ).then((value) {
      data = value;
      getdata();
    });
  }

  readData(String sql) async {
    Database? db = await data;
    List<Map> response = await db!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? db = await data;
    int response = await db!.rawInsert(sql);
    getdata();
    return response;
  }

  updateData(String sql) async {
    Database? db = await data;
    int response = await db!.rawUpdate(sql);
    return response;
  }

  void change(bool v) {
    passwordvisiablilty = v;
    emit(ShowHide1());
  }

  void change2(bool v) {
    passwordvisiablilty2 = v;
    emit(ShowHide2());
  }

  List<Map> tasks = [];
  void getdata() async {
    Database? db = await data;
    await db.rawQuery("Select * From user").then((value) {
      tasks = value;
      print(tasks);
    });
    ;
  }

  void checkdoubleemails(value) {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i]['email'] == value) {
        checkemail = true;
        break;
      }
    }
  }
}