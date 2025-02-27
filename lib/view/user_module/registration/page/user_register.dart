import 'package:flutter/material.dart';
import 'package:jewellery_app/view/user_module/login/page/user_login.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 26, 27, 27),
                  Color.fromARGB(255, 87, 3, 82),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: const Text(
              "Sign Up!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        _buildInputField("Name", _nameController, TextInputType.text),
                        _buildInputField("Email", _emailController, TextInputType.emailAddress),
                        _buildPasswordField("Password", _passwordController, true),
                        _buildPasswordField("Confirm Password", _confirmPasswordController, false),
                        const SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Registration Successful")),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 93, 7, 87),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            ),
                            child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white)),
                          ),
                        ),
                              
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UserLogin(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 93, 7, 87),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color.fromARGB(255, 93, 19, 83), fontSize: 16),
        ),
        TextFormField(
          controller: controller,
          keyboardType: type,
          decoration: const InputDecoration(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            }
            if (label == "Email" && !RegExp(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$').hasMatch(value)) {
              return "Enter a valid email";
            }
            return null;
          },
        ),
        const SizedBox(height: 2),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color.fromARGB(255, 93, 19, 83), fontSize: 16),
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? !_isPasswordVisible : !_isConfirmPasswordVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                isPassword ? (_isPasswordVisible ? Icons.visibility : Icons.visibility_off) : (_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
              ),
              onPressed: () {
                setState(() {
                  if (isPassword) {
                    _isPasswordVisible = !_isPasswordVisible;
                  } else {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  }
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            }
            if (isPassword && value.length < 6) {
              return "Password must be at least 6 characters long";
            }
            if (!isPassword && value != _passwordController.text) {
              return "Passwords do not match";
            }
            return null;
          },
        ),
       const SizedBox(height: 2),
      ],
    );
  }
}
