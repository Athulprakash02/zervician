import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zervician/auth/widgets/auth_text_field_widget.dart';
import 'package:zervician/blocs/auth/auth_bloc.dart';
import 'package:zervician/constants/app_strings.dart';
import 'package:zervician/home/home.dart';
import 'package:zervician/services/auth_service/auth_service.dart';
import 'package:zervician/widgets/elevated_button_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoaded) {
          
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).colorScheme.primary.withOpacity(0.3), Theme.of(context).colorScheme.background],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(AppStrings.login,style:TextStyle(fontSize: size.width*0.1,fontWeight: FontWeight.bold,),),
                    SizedBox(
                  height: 50,),
                AuthTextFieldWidget(
                  hintText: AppStrings.username,
                  textEditingController: usernameController,
                  keyboardType: TextInputType.name,
                  validator: AuthService().nameValidator,
                  obscureText: false,
                  prefixIcon: const Icon(Icons.person),
                  
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthTextFieldWidget(
                  hintText: AppStrings.password,
                  textEditingController: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: AuthService().passwordValidator,
                  prefixIcon: const Icon(Icons.lock),
                  
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
          
                    if(state is AuthLoading){
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButtonWidget(size: size, buttonText: AppStrings.login, color: Theme.of(context).colorScheme.primary, onpressed: () {
                       if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                                username: usernameController.text,
                                password: passwordController.text));
                          }
                    },);
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
