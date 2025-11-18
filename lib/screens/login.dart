import 'package:flutter/material.dart';
import 'package:flutter_application_20/providers/authprovider.dart';
import 'package:flutter_application_20/screens/homescreen.dart';
import 'package:flutter_application_20/screens/signup.dart';
import 'package:flutter_application_20/widgets/textfieldwidget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Login")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFieldWidget(
              controller: emailcontroller,
              label: 'Email',
              iconData: Icons.email,
              showpass: false,
              vald: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
              },
            ),
            TextFieldWidget(
              controller: passwordcontroller,
              label: 'Password',
              iconData: Icons.password,
              showpass: true,
              vald: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  await provider.login(
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                  );
                  if (provider.authModel?.messege == 'Login successful' &&
                      provider.authModel?.id != -1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen(userId: provider.authModel!.id)),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(provider.authModel?.messege ?? '')),
                  );
                }
              },
              child: Text("Login "),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text("Don't Have An Account? Sign-up"),
            ),
          ],
        ),
      ),
    );
  }
}
