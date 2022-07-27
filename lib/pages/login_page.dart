import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';



//services
import '../services/navigation_service.dart';


//widgets
import '../widgets/custome_input_fields.dart';
import '../widgets/rounded_button.dart';


//providers
import '../providers/authentication_provider.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late double deviceHeight ;
  late double deviceWidth;

  late Authenticationprovider _auth;
  late NavigationService _navigation;

  final _loginFormkey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {

    
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<Authenticationprovider>(context);
   _navigation = GetIt.instance.get<NavigationService>(); 

    return _buildUI();
  }

  Widget _buildUI()
  {

    return Scaffold(

        body: Container(

          
          padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.03 , vertical: deviceHeight*0.02), 
          height:  deviceHeight*0.98,
          width:  deviceWidth* 0.97,
          child:  Column(

              
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                _pageTitle(),

                SizedBox(height: deviceHeight * 0.04,),

                _LoginForm(),

                 SizedBox(height: deviceHeight * 0.05,),

                _loginButton(),

                SizedBox(height: deviceHeight * 0.02,),

                _registerAccountLink(),



              ],


          ),
        
        
        ),

    );
  }



 Widget _pageTitle()
 {
   return Container(
     

      height: deviceHeight*0.10,
      child: Text("SYPHER" , style: new TextStyle(fontSize: 40 , fontWeight: FontWeight.w600,
      
      foreground: Paint()..shader = LinearGradient(
        
        colors: <Color>[
          Colors.pinkAccent,
          Colors.blueAccent,
          Colors.red,

        ],
      
      
       ).createShader(Rect.fromLTWH(25, 25, 200, 100)),
      
      
      
      ) ,
      
    
      
      ),


   );
 }


Widget _LoginForm()
{

    return Container(

      height: deviceHeight*0.18,

     //padding: EdgeInsets.fromLTRB(0,15,0,0),
      child: Form(
        
        key: _loginFormkey,
        
        child: SingleChildScrollView(
          
          child: Column(
            
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
        
            children: [
        
              CustomeTextFormField(
                onSaved: (_value){
        
                  setState(() {
                    _email =_value;
                  });
                }, 
              regEx: r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
               hintText: "Email", 
               obscureText: false),
        
                //SizedBox(height: deviceHeight*0.00001,),

              CustomeTextFormField(
                onSaved: (_value){
        
                    
                  setState(() {
                    _password =_value;
                  });
        
                },
                 regEx: r".{8,}", 
                 hintText: "Password",
                  obscureText: true),
            ],
        
        
              
            
            
            
            ),
        ),
      
      
      
      
      
      ),



    );
}


Widget _loginButton()
{
  return RoundedButton(name: "Login", 
  height: deviceHeight*0.065, 
  width: deviceWidth*0.65,
   onPressed: (){
      
      if (_loginFormkey.currentState!.validate())
      {
        print("Email: $_email , Password: $_password");
          _loginFormkey.currentState!.save();
           
          print("Email: $_email , Password: $_password");

          _auth.loginusingEmailAndPassword(_email!, _password!);

         

      } 

   });
}


Widget _registerAccountLink()
{

  return GestureDetector(



    onTap: () => _navigation.navigateToRoute('/register'),
    child: Container(
  
      child: Text("Don\'t have account?"   , style: TextStyle(color: Colors.blueAccent),),
  
    ),
  );

}



}