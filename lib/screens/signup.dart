import 'package:flutter/material.dart';
import 'package:flutter_application_20/providers/authprovider.dart';
import 'package:flutter_application_20/screens/homescreen.dart';
import 'package:flutter_application_20/screens/login.dart';
import 'package:flutter_application_20/widgets/textfieldwidget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController contactcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Sign-up")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFieldWidget(
              controller: namecontroller,
              label: 'Name',
              iconData: Icons.account_circle,
              showpass: false,
              vald: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is required";
                }
              },
            ),
            TextFieldWidget(
              controller: contactcontroller,
              label: 'Contact',
              iconData: Icons.phone,
              showpass: false,
              vald: (value) {
                if (value == null || value.isEmpty) {
                  return "Contact is required";
                }
              },
            ),

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
                  await provider.sigup(
                    name: namecontroller.text,
                    contact: contactcontroller.text,
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                  );

                  if (provider.authModel?.messege ==
                      'Customer signed up successfully') {
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
              child: Text("Sign-Ip"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Have Already An Account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
