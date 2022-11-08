import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rudransh_glowbmo_application/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 54, 99),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 25.0,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 30,
            ),
            child: Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(40),
                ),
                intensity: 1,
                depth: -7,
                lightSource: LightSource.topRight,
                shadowLightColorEmboss: const Color.fromARGB(
                  255,
                  40,
                  46,
                  80,
                ),
                shadowDarkColorEmboss: const Color.fromARGB(
                  255,
                  16,
                  18,
                  33,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 40, 46, 80)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.76,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 40, 46, 80),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.transparent,
                      cursorWidth: 0,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Email Address",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 30,
            ),
            child: Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(40),
                ),
                intensity: 1,
                depth: -7,
                lightSource: LightSource.topRight,
                shadowLightColorEmboss: const Color.fromARGB(
                  255,
                  40,
                  46,
                  80,
                ),
                shadowDarkColorEmboss: const Color.fromARGB(
                  255,
                  16,
                  18,
                  33,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 40, 46, 80)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.76,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 40, 46, 80),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.transparent,
                      cursorWidth: 0,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: NeumorphicButton(
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8, right: 8),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 54, 54, 99),
                ),
              ),
            ),
          )),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
            },
            child: Center(
              child: Text(
                "New User? SignUp",
                style: TextStyle(color: Colors.white60),
              ),
            ),
          )
        ],
      ),
    );
  }
}
