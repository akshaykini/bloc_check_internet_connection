import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_check_internet_connection/bloc/events/internet_check_event.dart';
import 'package:bloc_check_internet_connection/bloc/states/internet_check_state.dart';
import 'package:connectivity/connectivity.dart';

class Internet_check_bloc extends Bloc<InternetEvent,Internetstate>{

    Connectivity _connectivity = Connectivity();
    StreamSubscription? connectivitySubscription;

    Internet_check_bloc() : super(Internetinitialstate()){
    on<Internetlossevent>((event, emit) => emit(Internetlossstate()));
    on<Internetgainevent>((event, emit) => emit(Internetgainstate()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((status) {
      if(status == ConnectivityResult.mobile || status == ConnectivityResult.wifi){
        add(Internetgainevent());
      }
      else{
        add(Internetlossevent());
      }
    });

}

@override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}