import 'package:flutter/material.dart';

Future<void> showAddAppDialog(context, Function call) async {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.302,
          child: AddAppForm(call),
        ),
      );
    },
  );
}

class AddAppForm extends StatelessWidget {
  final Function onSubmit;
  AddAppForm(this.onSubmit);
  final _formKey = GlobalKey<FormState>();
  final nameCon = TextEditingController();
  final linkCon = TextEditingController();
  void submit() {
    if (!_formKey.currentState!.validate()) return;
    onSubmit(nameCon.text, linkCon.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameCon,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'App Name',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'the name could not be empty';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: linkCon,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'App Link',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (!RegExp( r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?").hasMatch(value!))
                  return 'Link is not valid';
                return null;
              },
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: submit,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Add Custom App'),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Cancel'),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
