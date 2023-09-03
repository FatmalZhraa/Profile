import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icluppppp/bloc/appcubit__cubit.dart';
import 'package:icluppppp/bloc/appcubit__state.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, Parent>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        Appcubit cubit = BlocProvider.of(context)..createDatabase();
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(cubit.User_name,style:TextStyle(fontSize: 30) ),
                Text(cubit.User_Email,style:TextStyle(fontSize: 30) ),
                Text(cubit.User_phone,style:TextStyle(fontSize: 30) ),
                Text(cubit.User_Height,style:TextStyle(fontSize: 30) ),
                Text(cubit.User_Age,style:TextStyle(fontSize: 30)),
              ],
            ),
          ),
        );
      },
    );
  }
}
