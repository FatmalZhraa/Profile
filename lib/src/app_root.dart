import 'package:flutter/material.dart';
import 'package:icluppppp/screens/ssign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/appcubit__cubit.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => Appcubit(),
            ),
          ],
          child: MaterialApp(home: Sign_Up(),),
        );
    }
}
