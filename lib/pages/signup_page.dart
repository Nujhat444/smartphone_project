import 'package:flutter/material.dart';
import 'package:smartphone_project/auth/auth_service.dart';
import 'package:smartphone_project/crud_operation/operation.dart';
import 'package:smartphone_project/pages/login_page.dart';
import 'package:smartphone_project/pages/profile_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() {
    return Sign_up_State();
  }
}

class Sign_up_State extends State<Signup> {
  final supabase = Supabase.instance.client;

  final _Email_controller = TextEditingController();
  final _Password_controller = TextEditingController();
  final _confirm_password_controller = TextEditingController();
  final _Phone_controller = TextEditingController();
  final _name_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth_service = AuthService();

    void SignUp() async {
      final email = _Email_controller.text;
      final password = _Password_controller.text;
      final confirm_password = _confirm_password_controller.text;


      if (password == confirm_password) {
        try {
          await auth_service.signUpWithEmailPassword(email, password);
          print(1);
          final id = supabase.auth.currentUser!.id;
          print(id);
          await CrudOperation.insert_data(id,email,password);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: $e")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password is not matching")),
        );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            color: Colors.indigo,
          ),

          Center(
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(height: 200),
                ),

                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          // Email
                          TextField(
                            controller: _Email_controller,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Password
                          TextField(
                            controller: _Password_controller,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Confirm Password
                          TextField(
                            controller: _confirm_password_controller,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Sign Up Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(200, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: SignUp,
                            child: const Text("Sign Up"),
                          ),

                          const SizedBox(height: 10),

                          // Sign In
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.indigo),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
