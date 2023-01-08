import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomLoginButton.dart';
import 'package:sweety/Component/CustomTextFile.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/SignUpPage.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: MyColors.color2,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(MediaQuery.of(context).size.width/5))
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width/2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sweety',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    Image.asset('images/donut.png'),
                  ],
                )
              ),
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5,5),
                          blurRadius: 5
                      )
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(hintText:'Username or Email' ),
                    const SizedBox(height: 20,),
                    CustomTextField(hintText: 'Password'),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      child: Text(
                        'Forget password?',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        child:const Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.color4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/5,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(
                                text: 'Don\'t have account? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: 'Sign up now.',
                                style: TextStyle(
                                    color: MyColors.color4
                                ),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUppage()));
                              }
                            )
                          ],
                          style: TextStyle(
                              fontSize: 16
                          )
                      )
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'or use other method',
                    style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  const SizedBox(height: 10,),
                  CustomLoginButton(icon: 'images/icons/google.png',text: 'Đăng nhập với Google'),
                  const SizedBox(height: 10,),
                  CustomLoginButton(icon: 'images/icons/facebook.png',text: 'Đăng nhập với Facebook'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  }




