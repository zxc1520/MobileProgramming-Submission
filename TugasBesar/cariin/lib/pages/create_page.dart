import 'dart:io';

import 'package:cariin/controllers/lost_item.dart';
import 'package:cariin/pages/home_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController datelost = TextEditingController();

  // File? image;
  String? imageUrl = '';

  Future getimage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference reference = FirebaseStorage.instance.ref();
    Reference referenceDirImage = reference.child('child');

    Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);

    await referenceImageToUpload.putFile(File(photo!.path));
    imageUrl = await referenceImageToUpload.getDownloadURL();

    const CircularProgressIndicator(
      color: Color(0xFF360828),
    );

    setState(() {
      imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Publikasikan barang temuan",
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Nama barang hilang",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            TextFormField(
              controller: desc,
              decoration: InputDecoration(
                  hintText: "Deskripsi Barang",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            TextFormField(
              controller: datelost,
              decoration: InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  labelText: 'Pick-Up a date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40))),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  String formatedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  setState(() {
                    datelost.text = formatedDate;
                  });
                }
              },
            ),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  await getimage();
                },
                child: Text(
                  "Take Photo",
                  style: GoogleFonts.ubuntu(),
                ),
                style:
                    OutlinedButton.styleFrom(padding: const EdgeInsets.all(10)),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final path = imageUrl!;
                    final nama = name.text;
                    final desk = desc.text;
                    final hari = datelost.text;
                    final status = "Unclaimed";

                    createLost(
                        path: path,
                        name: nama,
                        desc: desk,
                        datelost: hari,
                        status: status);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Publish Lost Item",
                    style: GoogleFonts.ubuntu(),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      primary: const Color(0xFF2B001D))),
            )
          ],
        ),
      ),
    );
  }
}
