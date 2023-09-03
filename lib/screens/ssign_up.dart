import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icluppppp/bloc/appcubit__cubit.dart';
import 'package:icluppppp/bloc/appcubit__state.dart';
import 'package:icluppppp/screens/login.dart';


class Sign_Up extends StatelessWidget {
  Sign_Up({super.key});
  var FormKey = GlobalKey<FormState>();
  bool passwordvisiablilty2 = false;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Height = TextEditingController();

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
                    child: Text('Sign Up'),
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
                          Text("Name",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          ////////////////////////////////////////////Name//////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                            controller: name,
                            decoration: InputDecoration(
                                hintText: "Please Enter your name ",
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
                          Text("Email",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          ////////////////////////////////////////Email//////////////////////////////
                          TextFormField(
                            validator: (value) {
                              cubit.checkdoubleemails(email.text);
                              String pattern = r'\w+@\w+\.\w+';
                              if (value == null || value.isEmpty) {
                                return 'Please Enter your Email';
                              } else if (!RegExp(pattern).hasMatch(value))
                                return 'Invalid Email Address format.';
                              else if (cubit.checkemail == true) {
                                email.text = "";
                                cubit.checkemail = false;
                                return 'This Email already exist';
                              }

                              return null;
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Please Enter your Email",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.all(8),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Phone",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          ///////////////////////////////////////Phone//////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value.toString() == '') {
                                return 'Please enter your phone';
                              }
                              return null;
                            },
                            controller: phone,
                            decoration: InputDecoration(
                                hintText: "Please Enter your Phone ",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold),
                                border: UnderlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.white,
                                filled: true),
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
                              String pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                              if (!RegExp(pattern).hasMatch(value.toString()))
                                return '''
 Password must be at least 8 characters,
 include an uppercase letter, number and symbol.
      ''';
                              else if (value == null || value.isEmpty) {
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
                          Text("Confirm Password",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          /////////////////////////Confirm Password/////////////////////////////////////
                          TextFormField(
                            controller: confirmPassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please re enter the password ';
                              } else if (confirmPassword.text !=
                                  password.text) {
                                return 'Doesnt match the password';
                              }
                              return null;
                            },
                            obscureText: !cubit.passwordvisiablilty2,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                                hintText: "Please confirm your Passowrd ",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    cubit.passwordvisiablilty2 == true
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    cubit.change2(!cubit.passwordvisiablilty2);
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
                          Text("Age",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          //////////////////////////////Age///////////////////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Age';
                              } else if (int.parse(value) < 12 ||
                                  int.parse(value) > 95)
                                return 'Age start from 12 to 95';
                              return null;
                            },
                            controller: Age,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Please Enter your Age ",
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
                          Text("Height",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          //////////////////////////////////Height////////////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your height';
                              }
                              return null;
                            },
                            controller: Height,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Please Enter your Height ",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold),
                                border: UnderlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (FormKey.currentState!.validate()) {
                                      int response = await cubit.insertData(
                                          '''INSERT INTO user ( 'name' , 'email' , 'phone' , 'password' , 'age' , 'height' )
                                        VALUES ("${name.text}","${email.text}","${phone.text}",
                                        "${password.text}","${Age.text}","${Height.text}")''').then((value) {
                                        print("done");
                                        name.text = '';
                                        email.text = '';
                                        phone.text = '';
                                        password.text = '';
                                        confirmPassword.text = '';
                                        Age.text = '';
                                        Height.text = '';
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return Log_in();
                                                }));
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('file the data')),
                                      );
                                    }
                                    cubit.getdata();
                                  },
                                  child: Icon(Icons.arrow_forward, size: 35),
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