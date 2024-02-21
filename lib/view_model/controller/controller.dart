


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ServiceController extends GetxController{

  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;


  XFile? logoImage;
  XFile? profileImage;
  final picker = ImagePicker();

  TimeOfDay? start;
  TimeOfDay? end;


  Future<void> startTime(BuildContext context) async {

    final startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

      if (startTime != null) {
        start = startTime;
        update();
      } else {
        print('No time Selected');
      }
      update();

    if (start != null) {
      print('Selected time: ${start!.hour}:${start!.minute}');
    }
  }

  Future<void> endTime(BuildContext context) async {

    final endTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

      if (endTime != null) {
        end = endTime;
      } else {
        print('No time Selected');
      }
      update();

    if (end != null) {
      print('Selected time: ${end!.hour}:${end!.minute}');
    }
  }

  Future<Position> getLocationPermission() async {

    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace){
      print('Error' + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  Future logoBottomSheet(BuildContext context) async {

    Future getLogoCameraImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        logoImage = pickedFile;
        update();
      }

      else {
        print('No Image Selected');
      }
      update();
    }

    Future getLogoGalleryImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        logoImage = pickedFile;
        update();
      }

      else {
        print('No Image Selected');
      }
      update();
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.add_a_photo),
              title: const Text('Camera'),
              onTap: () {
                getLogoCameraImage();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                getLogoGalleryImage();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future profileBottomSheet(BuildContext context) async {

    Future getProfileCameraImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        profileImage = pickedFile;
        update();
      }

      else {
        print('No Image Selected');
      }
      update();
    }

    Future getProfileGalleryImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = pickedFile;
        update();
      }

      else {
        print('No Image Selected');
      }
      update();
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.add_a_photo),
                title: Text('Camera'),
                onTap: () {
                  getProfileCameraImage();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  getProfileGalleryImage();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }


}