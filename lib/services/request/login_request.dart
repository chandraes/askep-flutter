import 'dart:async';  
  
import 'package:login_ui/models/user.dart';  
import 'package:login_ui/data/CtrQuery/login_ctr.dart';  
  
class LoginRequest {  
  LoginCtr con = new LoginCtr();  
  
 Future<User?> getLogin(String username, String password) {  
    var result = con.getLogin(username,password);  
    return result;  
  }  
} 