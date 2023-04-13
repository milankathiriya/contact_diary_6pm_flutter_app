import 'package:contact_diary_6pm_app/models/contact.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.circle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(flex: 4),
                CircleAvatar(
                  radius: 50,
                  foregroundImage: (contact.imgFile != null)
                      ? FileImage(contact.imgFile)
                      : null,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "${contact.firstName} ${contact.lastName}",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+91 ${contact.phoneNumber}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.phone),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        mini: true,
                        elevation: 0,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.message),
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        mini: true,
                        elevation: 0,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.email),
                        backgroundColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.white,
                        mini: true,
                        elevation: 0,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.share),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        mini: true,
                        elevation: 0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
