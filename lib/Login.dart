import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

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
          _Loginbox(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don\'t have account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(
                        text: 'Sign up now.',
                        style: TextStyle(
                          color: MyColors.color4
                        )
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
                _CustomLoginBT(icon: 'images/icons/google.png',text: 'Đăng nhập với Google'),
                const SizedBox(height: 10,),
                _CustomLoginBT(icon: 'images/icons/facebook.png',text: 'Đăng nhập với Facebook'),
                const SizedBox(height: 100,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _CustomLoginBT({required String icon, required String text}) {
    return Container(
                height: 50,
                margin:const EdgeInsets.symmetric(horizontal: 100),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  ),
                  borderRadius:const BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:const EdgeInsets.all(10),
                      child: Image.asset(
                          icon,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                              text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}

class _Loginbox extends StatelessWidget {
  const _Loginbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
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
              _CusTomTextField(hintText: 'Username or Email'),
              const SizedBox(height: 20,),
              _CusTomTextField(hintText: 'Password'),
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
      ),
    );
  }

  TextField _CusTomTextField({required String hintText}) {
    return TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 2
                  )
                ),
                hintText: hintText
              ),
            );
  }
}

