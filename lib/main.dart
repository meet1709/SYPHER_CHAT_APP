

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';


//providers
import 'package:chat_app/providers/authentication_provider.dart';

//pages
import './pages/splash_page.dart';
import './pages/login_page.dart';
import './pages/home_page.dart';
import './pages/register_page.dart';

//services
import 'package:chat_app/services/navigation_service.dart';

void main() {
  runApp(
    
    
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: (){

          runApp(MainApp(),);


      }, ));
}

class MainApp extends StatelessWidget {
  //const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [

        ChangeNotifierProvider<Authenticationprovider>(

          create: (BuildContext _context){

              return Authenticationprovider();

          },
        )
      ],



      child: MaterialApp(
    
          title: "SYPHER..",
          theme: ThemeData(
            //backgroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(36, 35, 49,1.0),
              //backgroundColor: Colors.green,
           scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49,1.0),
           //scaffoldBackgroundColor: Colors.white,
           bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
           
           
           ),
           
           
           
           ),
    
    
           navigatorKey: NavigationService.navigatorKey,
           initialRoute: '/login',
    
          routes: {
    
            '/login' : (BuildContext context) => LoginPage(),
            '/home' : (BuildContext context) => HomePage(),
            '/register' : (BuildContext context)=> RegisterPage(),
    
          },
            
    
    
      ),
    );
  }
}

