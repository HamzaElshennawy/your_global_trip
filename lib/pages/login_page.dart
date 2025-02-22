import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PageController _pageController = PageController();
  bool isLogin = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void _showAuthDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _handleAuth() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();

    if (username.isEmpty || password.isEmpty || (!isLogin && email.isEmpty)) {
      _showAuthDialog("Error", "Please fill in all fields.");
      return;
    }

    if (isLogin) {
      _showAuthDialog("Login Successful", "Welcome, $username!");
    } else {
      _showAuthDialog("Signup Successful", "Account created for $username.");
    }
  }

  void _switchPage() {
    setState(() {
      isLogin = !isLogin;
    });
    _pageController.animateToPage(
      isLogin ? 0 : 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildAuthScreen(String title, bool isLoginForm) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100), // Move logo higher
            Center(
              child: Image.asset(
                "assets/planelogo.png",
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLoginForm ? "Username" : "Full Name",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: isLoginForm
                        ? "Enter your username"
                        : "Enter your full name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey
                            .withOpacity(0.4), // Opacity applied here
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color:
                            Colors.grey.withOpacity(0.6), // Darker when focused
                        width: 2,
                      ),
                    ),
                  ),
                ),
                if (!isLoginForm) ...[
                  const SizedBox(height: 10),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.4),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.6),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.4),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.6),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleAuth,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(title),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: _switchPage,
                child: Text(
                  isLoginForm
                      ? "Don’t have an account? Sign up"
                      : "Already have an account? Login",
                  style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: _switchPage,
                child: RichText(
                  text: TextSpan(
                    text: "Continue as a ",
                    children: [
                      TextSpan(
                        text: "Guest",
                        style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildAuthScreen("Login", true),
          _buildAuthScreen("Sign Up", false),
        ],
      ),
    );
  }
}
