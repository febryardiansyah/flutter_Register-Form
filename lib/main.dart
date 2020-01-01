import 'package:flutter/material.dart';
import 'package:form_validation/validasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registrasi'),
        ),
        body: LayarPendaftaran(),
      ),
    );
  }
}

class LayarPendaftaran extends StatefulWidget{
  createState(){
    return PendaftaranState();
  }
}


class PendaftaranState extends State <LayarPendaftaran> with Validation{
  final formKey = GlobalKey <FormState>();

  String name = '';
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            namaField(),
            emailField(),
            passwordField(),
            registerButton(),
          ],
        ),
      ),
    );
  }
  Widget namaField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Nama lengkap',
        suffixIcon: Icon(Icons.person_outline),
      ),
      validator: validasiNama,
      onSaved: (String value){
        name = value;
      },
    );
  }
  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.email),
          labelText: 'Email',
          hintText: 'exemple@email.com'
      ),
      validator: validasiEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }
  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter Password',
          suffixIcon: Icon(Icons.security)
      ),
      validator: validasiPassword,
      onSaved: (String value){
        pass = value;
      },
    );
  }
  Widget registerButton(){
    return FlatButton(
      color: Colors.transparent,
      onPressed: (){
        if (formKey.currentState.validate()){
          formKey.currentState.save();
        }
      },
      child: Text('Daftar'),
    );
  }
}
