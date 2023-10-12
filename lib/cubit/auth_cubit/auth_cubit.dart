import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_bloc/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  AuthCubit() :super(AuthInitialState());

  void sendOTP(String phoneNo)async{

  }
  void verifyOTP(String otp)async{

  }
  void signInWithPhone()async{

  }

}