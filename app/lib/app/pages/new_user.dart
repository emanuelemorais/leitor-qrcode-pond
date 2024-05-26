import 'package:flutter/material.dart';
import 'package:app/app/widgets/custom_input.dart';
import 'package:flutter/widgets.dart';
import 'package:app/app/services/user.dart';

class NewUserPage extends StatefulWidget {
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  String _name = '';
  String _email = '';
  String _password = '';

  void _onChangedEmail(String value) {
    setState(() {
      _email = value;
    });
  }

  void _onChangedPassword(String value) {
    setState(() {
      _password = value;
    });
  }

  void _onChangedName(String value) {
    setState(() {
      _name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar nova conta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 40.0, end: 40.0, bottom: 22.0),
              child: CustomInput(
                  onChanged: _onChangedName,
                  label: 'Nome',
                  icon: Icons.person),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 40.0, end: 40.0, bottom: 22.0),
              child: CustomInput(
                  onChanged: _onChangedEmail,
                  label: 'E-mail',
                  icon: Icons.email),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 40.0, end: 40.0, bottom: 22.0),
              child: CustomInput(
                  onChanged: _onChangedPassword,
                  label: 'Senha',
                  icon: Icons.lock),
            ),
            Container(
              width: 200, 
              height: 50, 
              child: ElevatedButton(
                onPressed: () async {
                  await createUser(_email, _name, _password);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.purple), 
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), 
                    ),
                  ),
                ),
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
