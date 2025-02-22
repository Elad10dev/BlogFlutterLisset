import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(255, 255, 200, 218),
              const Color.fromARGB(255, 255, 128, 170),
              Colors.pinkAccent,
              const Color.fromARGB(255, 225, 57, 255),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Icon
                    const Icon(
                      Icons.book_rounded,
                      size: 150,
                      color: Color.fromARGB(255, 124, 0, 108),
                    ),
                    const SizedBox(height: 30),
                    // Hello
                    Text(
                      "Bienvenido de nuevo!!  👋😄",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 48,
                        color: const Color.fromARGB(255, 124, 0, 108),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Te extrañamos en el club, accede y disfruta todo el contenido que tenemos para ti!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 124, 0, 108),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 200.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 128, 170),
                          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 200.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 128, 170),
                          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 300.0),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Iniciar Sesión')),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 204, 18, 236),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Iniciar Sesion..!',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    // Not member? Register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Aun no eres parte de nuestro club? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 124, 0, 108),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text( 'Registrate aqui..! ', 
                        style: TextStyle( 
                          color: Color.fromARGB(255, 11, 11, 255), 
                          fontWeight: FontWeight.bold, 
                          ), 
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '...Volver al Home!',
                            style: TextStyle(
                              color: Color.fromARGB(255, 11, 11, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
