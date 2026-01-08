
import 'package:flutter/material.dart';
import 'package:smartphone_project/auth/auth_service.dart';
import 'package:smartphone_project/pages/profile_page.dart';
import 'package:smartphone_project/pages/signup_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() {
    return SignIn_state();
  }
}
class SignIn_state extends State<SignIn> {
  final _Email_controller = TextEditingController();
  final _Password_controller = TextEditingController();
  final auth_service = AuthService();
  void LogIn() async //LogIn after button pressed
      {
    final email = _Email_controller.text;
    final password = _Password_controller.text;

    try {
      await auth_service.signInWithEmailPassword(email, password);
      Navigator.push(context, MaterialPageRoute(builder: (context){return ProfilePage();}));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error:$e")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.brown,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: SizedBox(height: 200,)),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text("Please Log in Your Account First!!!",style: TextStyle(color: Colors.brown[900]),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: _Email_controller,
                            decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),

                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: _Password_controller,
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[400],

                            foregroundColor: Colors.white,
                            minimumSize: Size(200, 50),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: (){
                            LogIn();

                          }, child: Text("Sign In"),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Signup()),
                                );
                              },
                              child: Text("Sign up",style: TextStyle(color: Colors.brown[600])),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}