import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:i_baza/core/adapter/hive_type_adapter.dart';
import 'package:i_baza/core/database/objectbox.dart';
import 'package:i_baza/features/authentication/data/models/authenticated_user.dart';
import 'package:i_baza/features/presentation/login_screen/login_screen.dart';
import 'package:i_baza/objectbox.g.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:share_plus/share_plus.dart';

import 'core/injector/storege_ropistory.dart';
import 'features/presentation/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerAdapters();
  // await StorageRepository.getInstance();
  await HiveService().initHive();
  // await initHive();

  // await LocaleDatabase.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? avatar;

  List<File> files = [];

  Future<void> pickAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.camera);

    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      files.addAll(
        result.files
            .map((file) => File.fromUri(
                  Uri.file(file.path ?? ''),
                ))
            .toList(),
      );
      setState(() {});
    }
  }

  // int _counter = 0;

  var myBox = HiveService().box;

  void _incrementCounter() async {
    await myBox.put('is_hivee', 'Xojiakbarov');
    await myBox.put(
        'auth_user',
        AuthenticatedUserModel(
          id: 'u1910255',
          firstName: 'Xojiakbar',
          lastName: 'Xojiakbarov',
        ));

    // await HiveService.setAuthStatus(true);
    // await box?.put("is_hive", "Xojiakbar");
    // setState(() {
    //   _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Hive Service: ${myBox.get('is_hivee', defaultValue: 'incorrent')}'
                    // 'Is Hive:${box?.get("is_hive", defaultValue: "incorrect")}',
                    ),
                Text(
                  '${myBox.get('auth_user')}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SplashScreen()));
                    },
                    child: Text("Splash")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: Text("login")),
                Column(
                  children: [
                    Align(
                      child: Container(
                          width: 150,
                          height: 150,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: avatar == null
                              ? Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.grey,
                                )
                              : Image.file(
                                  avatar!,
                                  fit: BoxFit.cover,
                                )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 20,
                      children: List.generate(
                        files.length,
                        (index) => GestureDetector(
                          onTap: () async {
                            await OpenFile.open(files[index].path);
                          },
                          onLongPress: () async {
                            // Share.share('Hi, My name is "Xojiakbar');
                            await Share.shareXFiles([XFile(files[index].path)]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              files[index]
                                  .path
                                  .split(Platform.pathSeparator)
                                  .last,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Text(
                //   '$_counter',
                //   style: Theme.of(context).textTheme.headlineMedium,
                // ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: pickAvatar,
            tooltip: 'Pick an avatar',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: pickFile,
            tooltip: 'Pick an avatar',
            child: const Icon(Icons.file_download),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:i_baza/core/injector/setup_locator.dart';
//
// import 'core/injector/storege_ropistory.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await StorageRepository.getInstance();
//   await initHive();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() async {
//     await StorageRepository.setAuthStatus(true);
//     await box?.put("is_hive", "Xojiakbar");
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Is Hive:${box?.get("is_hive", defaultValue: "incorrect")}',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
