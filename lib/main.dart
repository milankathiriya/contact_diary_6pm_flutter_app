import 'package:contact_diary_6pm_app/utils/app_themes.dart';
import 'package:contact_diary_6pm_app/utils/globals.dart';
import 'package:contact_diary_6pm_app/views/screens/add_contact_page.dart';
import 'package:contact_diary_6pm_app/views/screens/detail_page.dart';
import 'package:contact_diary_6pm_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: (isDark) ? ThemeMode.dark : ThemeMode.light,
      initialRoute: 'splash_screen',
      routes: {
        'add_contact_page': (context) => AddContactPage(),
        // 'edit_contact_page': (context) => ,
        'detail_page': (context) => DetailPage(),
        'splash_screen': (context) => SplashScreen(),
        '/': (context) => Scaffold(
              appBar: AppBar(
                title: const Text("Contacts"),
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.circle),
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              body: (Globals.allContacts.isNotEmpty)
                  ? ListView.builder(
                      padding: const EdgeInsets.all(16),
                      physics: const BouncingScrollPhysics(),
                      itemCount: Globals.allContacts.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('detail_page',
                                arguments: Globals.allContacts[i]);
                          },
                          leading: CircleAvatar(
                            radius: 30,
                            foregroundImage:
                                (Globals.allContacts[i].imgFile == null)
                                    ? null
                                    : FileImage(Globals.allContacts[i].imgFile),
                          ),
                          title: Text(
                              "${Globals.allContacts[i].firstName} ${Globals.allContacts[i].lastName}"),
                          subtitle:
                              Text("+91 ${Globals.allContacts[i].phoneNumber}"),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                            onPressed: () {},
                          ),
                        );
                      },
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.contact_page_outlined,
                            size: 200,
                          ),
                          Text(
                            "You have no contacts yet",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed('add_contact_page');
                },
              ),
            ),
      },
    );
  }
}
