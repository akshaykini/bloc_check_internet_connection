import 'package:bloc_check_internet_connection/bloc/blocscreen/internet_check_homepagebloc.dart';
import 'package:bloc_check_internet_connection/bloc/states/internet_check_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: BlocConsumer<Internet_check_bloc, Internetstate>(
            listener: (context, state) {
               if(state is Internetgainstate){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Internet Connected'),
                          backgroundColor: Colors.green,
                          ),
                      );
                    }
                    else if(state is Internetlossstate){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Internet Not Connected'),
                          backgroundColor: Colors.red,
                          ),
                      );
                    }
            },
            builder: (context, state) {
              
                  // builder: (context, state) {
                    if(state is Internetgainstate){
                      return Text('Connected!');
                    }
                    else if(state is Internetlossstate){
                      return Text('Not Connected!');
                    }
                    else {
                      return Text('Loading.....');
                    }

               
            },
          ),
        ),
      ),
    );
  }
}
