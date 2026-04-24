import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String message = "";
  Color messageColor = Colors.red;

  void register() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      setState(() {
        message = "All fields are required.";
        messageColor = Colors.red;
      });
      return;
    }

    setState(() {
      message = "Registered successfully!";
      messageColor = Colors.green;
    });

    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  Widget buildInput({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType type = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: type,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FB),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 15),

              if (message.isNotEmpty)
                Center(
                  child: Text(
                    message,
                    style: TextStyle(color: messageColor),
                  ),
                ),

              SizedBox(height: 10),
              buildInput(
                  label: "Name",
                  controller: nameController,
                ),

                buildInput(
                  label: "Email",
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),

                buildInput(
                  label: "Phone",
                  controller: phoneController,
                  type: TextInputType.phone,
                ),

                buildInput(
                  label: "Password",
                  controller: passwordController,
                  isPassword: true,
                ),

              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4A6CF7),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: register,
                  child: Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}