import 'package:flutter/material.dart';

class Modal{
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, 'Cancel Booking', Icons.cancel, _action1),
              _createTile(context, 'Back', Icons.keyboard_backspace, _action2),
            ],
          );
        }
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1(){
    print('action 1');
  }

  _action2(){
    print('action 2');
  }
}