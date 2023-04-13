import 'dart:io';

import 'package:contact_diary_6pm_app/models/contact.dart';
import 'package:contact_diary_6pm_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final GlobalKey<FormState> addContactFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String email = "";
  File? imgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              if (addContactFormKey.currentState!.validate()) {
                addContactFormKey.currentState!.save();

                Contact c1 = Contact(
                  firstName: firstName,
                  lastName: lastName,
                  phoneNumber: phoneNumber,
                  email: email,
                  imgFile: imgFile!,
                );

                Globals.allContacts.add(c1);

                await Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);

                setState(() {});
              }
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    child: Text("Add"),
                    foregroundImage:
                        (imgFile == null) ? null : FileImage(imgFile as File),
                  ),
                  FloatingActionButton(
                    mini: true,
                    child: Icon(Icons.add),
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();

                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.camera);

                      String path = xFile!.path;

                      setState(() {
                        imgFile = File(path);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: addContactFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First Name"),
                      TextFormField(
                        controller: firstNameController,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter first name first...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          firstName = val!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter first name here..."),
                      ),
                      const SizedBox(height: 12),
                      Text("Last Name"),
                      TextFormField(
                        controller: lastNameController,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter last name first...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          lastName = val!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter last name here..."),
                      ),
                      const SizedBox(height: 12),
                      Text("Phone Number"),
                      TextFormField(
                        controller: phoneNumberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter phone no. first...";
                          } else if (val!.length != 10) {
                            return "Enter 10 digit phone no...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          phoneNumber = val!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter phone no. here..."),
                      ),
                      const SizedBox(height: 12),
                      Text("Email"),
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter email first...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          email = val!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter email here..."),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
