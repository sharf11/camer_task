import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return _state();
  }
}
class _state extends State<Login>{

  String error="";

  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  FocusNode passwordNode=new FocusNode();
  final formKey=GlobalKey<FormState>();
  late UserCredential responce;
  bool passVisibility=true;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05,
        ),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:Colors.white,
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value){
                        FocusScope.of(context).requestFocus(passwordNode);
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return '';
                        }
                        return null;
                      },
                      //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                        focusedBorder:  new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                        focusedErrorBorder:new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        errorBorder:new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)
                        ),
                        suffixIcon: Icon(Icons.phone),
                        hintText:"Enter Email",
                        errorStyle: TextStyle(fontSize: 0),
                        hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                      ),
                      controller: email,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:Colors.white,
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      onFieldSubmitted: (value){
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      focusNode: passwordNode,
                      obscureText: passVisibility,
                      validator: (value){
                        if(value!.isEmpty){
                          return '';
                        }
                        // else if(loginValdite['Message']=="Password is incorrect.");
                        return null;
                      },
                      decoration: InputDecoration(

                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                        focusedBorder:  new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                        focusedErrorBorder:new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        errorBorder:new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)
                        ),
                        hintText: "Enter Password",
                        errorStyle: TextStyle(fontSize: 0),
                        hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                        suffixIcon:InkWell(
                          child: Icon(passVisibility?Icons.visibility:Icons.visibility_off,color: Colors.black38,),
                          onTap: (){
                            setState(() {
                              passVisibility=!passVisibility;
                            });
                          },
                        ) ,
                      ),
                      controller: password,
                    ),
                  ),
                 SizedBox(height: 20,),
                  error==""?SizedBox():Text(error,style: TextStyle(color: Colors.red),),
                  SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     GestureDetector(
                       onTap: ()async{
                         responce=await  auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
                         if(responce.user!.email.toString()!=null){
                           Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false);
                         }else{
                           setState(() {
                             error="user not found";
                           });;
                         }
                       },
                       child: Container(
                         width: MediaQuery.of(context).size.width*.4,
                         height: MediaQuery.of(context).size.height*.065,
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.teal
                         ),
                         child: Text("Login", style: TextStyle(color: Colors.white),)
                       ),
                     ),
                     GestureDetector(
                       onTap: ()async{
                    responce= await auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
                       if(responce.user!.email.toString()!=null){
                         Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false);
                       }else{
                         setState(() {
                           error="email has been existed";
                         });
                       }
                       },
                       child: Container(
                           width: MediaQuery.of(context).size.width*.4,
                           height: MediaQuery.of(context).size.height*.065,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                               color: Colors.teal
                           ),
                           child: Text("Register",style: TextStyle(color: Colors.white),)
                       ),
                     ),
                   ],
                 )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}