import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_auth_bloc/cubit/auth_cubit/auth_state.dart';
import 'package:phone_auth_bloc/verify_screen.dart';
class SignInScreen extends StatelessWidget {

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In with Phone"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextField(
                    controller: phoneController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Phone Number",
                        counterText: ""
                    ),
                  ),

                  SizedBox(height: 10,),

                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {

                      if(state is AuthCodeSentState) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => VerifyPhoneNumberScreen()
                        ));
                      }

                    },
                    builder: (context, state) {
                      if(state is AuthLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          onPressed: () {
                            String phoneNumber = "+91" + phoneController.text;
                            print(phoneNumber);
                            BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
                            print(phoneNumber);
                          },
                          color: Colors.blue,
                          child: Text("Sign In"),
                        ),
                      );

                    },
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}