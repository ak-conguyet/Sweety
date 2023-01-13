import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:sweety/main.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  bool _isChangePass = false;
  bool _isMatchPass = false;
  bool _isLengthCorrect = false;

  late TextEditingController enterPassController;
  late TextEditingController reEnterPassController;


  @override
  void initState() {
    super.initState();

    enterPassController = TextEditingController();
    reEnterPassController = TextEditingController();
    enterPassController.addListener(() {
      if(enterPassController.value.text.isNotEmpty){
        _isChangePass = true;
        if(enterPassController.text.length > 5){
          _isLengthCorrect = true;
        }
        else{
          _isLengthCorrect = false;
        }
      }else{
        _isChangePass = false;
      }

    });

    reEnterPassController.addListener(() {
      if(enterPassController.text == reEnterPassController.text){
        _isMatchPass = true;
      }
      else{
        _isMatchPass = false;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        physics:const BouncingScrollPhysics(),
        children: [
          SizedBox(
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(125)),
                child: Image.asset('images/avt_person.png',width: 250,height: 250,fit: BoxFit.cover,),
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                _buildTextField(
                    label: 'Name',
                    defaultText: 'Jonh'
                ),
                _buildTextField(
                    label: 'Phone number',
                    defaultText: '0123457687'
                ),
                _buildTextField(
                    label: 'Email address',
                    defaultText: 'igg.anhkiet1@gmail.com'
                ),
                _buildTextField(
                  controller: enterPassController,
                    label: 'New password',
                  isPassword: true
                ),
                _buildTextField(
                  controller: reEnterPassController,
                    label: 'Confirm new password',
                  isPassword: true
                ),
                ElevatedButton(
                    onPressed: ()=>saveAction(),
                    child: const Text('SAVE')
                ),
                const SizedBox(height: 100,)
              ],
            ),
          )
        ],
      ),
    );
  }

  void saveAction(){
    if(_isChangePass){
      if(!_isMatchPass){
        _showSnackBar('Confirm password is not match!!');
        return;
      }
      if(!_isLengthCorrect){
        _showSnackBar('The length of password not enough!!');
        return;
      }
      // change password
    }
    else{

    }
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Nofitication!',
          message: text,
          contentType: ContentType.failure,
        )));
  }

  Widget _buildTextField({String? defaultText, required String label, TextEditingController? controller, bool isPassword:false}){
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: defaultText,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 16),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(width: 2)),
            suffixIcon: const Icon(Icons.edit)),
        obscureText: isPassword,
      ),
    );
  }

}


