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
  String User_name = '';
  String User_Email = '';
  String User_phone = '';
  String User_Age = '';
  String User_Height = '';

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

  void saveusername(String v) {
    User_name = v;
    emit(Save_User_name());
  }

  void saveuseremail(String v) {
    User_Email = v;
    emit(Save_User_Email());
  }

  void saveuserphone(String v) {
    User_phone = v;
    emit(Save_User_phone());
  }

  void saveuserAge(String v) {
    User_Age = v;
    emit(Save_User_Age());
  }

  void saveuserheight(String v) {
    User_Height = v;
    emit(Save_User_Height());
  }
  void bb(int i) {
    User_name = tasks[i]["name"].toString();
    User_Email = tasks[i]["email"].toString();
    User_phone = tasks[i]["phone"].toString();
    User_Age = tasks[i]["age"].toString();
    User_Height = tasks[i]["height"].toString();
  }
}
