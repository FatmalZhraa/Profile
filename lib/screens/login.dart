
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icluppppp/bloc/appcubit__cubit.dart';
import 'package:icluppppp/bloc/appcubit__state.dart';
import 'package:icluppppp/screens/profile.dart';
import 'package:icluppppp/screens/ssign_up.dart';

class Log_in extends StatelessWidget {
  Log_in({super.key});
  var FormKey = GlobalKey<FormState>();
  bool passwordvisiablilty2 = false;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Height = TextEditingController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, Parent>(
      listener: (context, state) {},
      builder: (context, state) {
        Appcubit cubit = BlocProvider.of(context)..createDatabase();
        return Form(
            key: FormKey,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.grey,
                  title: Center(
                    child: Text('Login'),
                  ),
                ),
                backgroundColor: Colors.white,
                body: Center(
                  child: Container(
                      width: double.infinity,
                      height: 600,
                      child: ListView(
                        padding: EdgeInsets.all(30),
                        children: [
                          Text("Email",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          ////////////////////////////////////////////email//////////////////////////////
                          TextFormField(
                            validator: (value) {
                              String pattern = r'\w+@\w+\.\w+';
                              if (value == null || value.isEmpty) {
                                return 'Please Enter your Email';
                              } else if (!RegExp(pattern).hasMatch(value))
                                return 'Invalid Email Address format.';
                              return null;
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Please Enter your email ",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold),
                                border: UnderlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Password",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          ///////////////////////////////////Password/////////////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: password,
                            obscureText: !cubit.passwordvisiablilty,
                            decoration: InputDecoration(
                                hintText: "Please Enter your Passowrd ",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    cubit.passwordvisiablilty == true
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    cubit.change(!cubit.passwordvisiablilty);
                                  },
                                ),
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold),
                                border: UnderlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                            return Sign_Up();
                                          }));
                                    },
                                    child: Text('Dont have account')),
                                SizedBox(
                                  width: 65,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (FormKey.currentState!.validate()) {
                                      {
                                        for (int i = 0;
                                        i < (cubit.tasks).length;
                                        i++) {
                                          if (cubit.tasks[i]['email'] ==
                                              email.text &&
                                              cubit.tasks[i]['password'] ==
                                                  password.text) {
                                            check = true;
                                            break;
                                          } else if (cubit.tasks[i]['email'] ==
                                              email.text) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Wrong Password')));
                                            return null;
                                          } else if (cubit.tasks[i]
                                          ['password'] ==
                                              password.text) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content:
                                                Text('Wrong Email ')));
                                            return null;
                                          }
                                        }
                                        if (check == true) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    return Profile();
                                                  }));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Wrong Email or Password')));
                                        }
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          content: Text('Fill the data')));
                                    }
                                  },
                                  child: Text('Login'),
                                  backgroundColor: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                )));
      },
    );
  }
}