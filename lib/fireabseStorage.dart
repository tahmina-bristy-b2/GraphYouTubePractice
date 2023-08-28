import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class StorageFireScreen extends StatefulWidget {
  const StorageFireScreen({super.key});

  @override
  State<StorageFireScreen> createState() => _StorageFireScreenState();
}

class _StorageFireScreenState extends State<StorageFireScreen> {
  late Future<ListResult> listAllData;
  Map<int, double> downloadProgrees = {};
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  @override
  void initState() {
    listAllData = FirebaseStorage.instance.ref("pictures").listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: listAllData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final fileNmae = snapshot.data!.items;
            return ListView.builder(
                itemCount: snapshot.data!.items.length,
                itemBuilder: (context, index) {
                  final file = fileNmae[index];
                  double? progress = downloadProgrees[index];
                  return ListTile(
                    title: Text(file.name),
                    subtitle: progress != null
                        ? LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.black,
                          )
                        : null,
                    trailing: IconButton(
                        onPressed: () async {
                          await pictureDownload(index, file);
                        },
                        icon: const Icon(Icons.download)),
                  );
                });
          } else if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data has an error")));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  //*******************************picture download*************************** */

  Future pictureDownload(int index, Reference file) async {
    final getUrl = await file.getDownloadURL();
    final getTempDirectory = await getTemporaryDirectory();
    final path = '${getTempDirectory.path}/${file.name}';
    await Dio().download(
      getUrl,
      path,
      onReceiveProgress: (count, total) {
        double progress = total / count;
        setState(() {
          downloadProgrees[index] = progress;
        });
      },
    );
    if (getUrl.contains('.mp4')) {
      await GallerySaver.saveVideo(path, toDcim: true);
    } else if (getUrl.contains('.jpg')) {
      await GallerySaver.saveImage(path, toDcim: true);
    }
    if (!mounted) return true;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Download Image ${file.name}")));
  }

  uploadFile() {
    final path = 'files/my-image.jpg';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
  }

  selectedaFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) return null;
    setState(() {
      pickedFile = result!.files.first;
    });
  }
}
