import 'package:flutter/material.dart';
import 'package:food_project/Food%20Dictionary.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Food info.dart';
import 'Meal.dart';

//The following code is based heavily off of code provided by:
//  -Teresa Wu https://spltech.co.uk/flutter-image-classification-using-tensorflow-in-4-steps/
//  -Nancy Patel https://medium.com/geekculture/image-classification-with-flutter-182368fea3b

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {

  List? _listResult;
  PickedFile? _imageFile;
  bool _loading = false;

  File? _image;
  Image? _imageWidget;
  final picker = ImagePicker();

  FoodInfo? foodInfo;
  
  FoodInfo getCorrespondingFood(){
    String classification = _listResult![0]["label"];
    switch (classification) {
      case "0 Steak":
        return FoodDictionary.allFoods["Steak"]!;
      case "1 Chocolate":
        return FoodDictionary.allFoods["Chocolate"]!;
      case "2 Fish":
        return FoodDictionary.allFoods["Fish"]!;
      case "3 Lettuce":
        return FoodDictionary.allFoods["Lettuce"]!;
      case "4 Banana":
        return FoodDictionary.allFoods["Banana"]!;
      case "5 Taco":
        return FoodDictionary.allFoods["Taco"]!;
      case "6 Cookie":
        return FoodDictionary.allFoods["Cookie"]!;
      case "7 Cake":
        return FoodDictionary.allFoods["Cake"]!;
      case "8 Corn":
        return FoodDictionary.allFoods["Corn"]!;
      case "9 Tomato":
        return FoodDictionary.allFoods["Tomato"]!;
      case "10 Potato":
        return FoodDictionary.allFoods["Potato"]!;
      case "11 Celery":
        return FoodDictionary.allFoods["Celery"]!;
      case "12 Apple":
        return FoodDictionary.allFoods["Apple"]!;
      case "13 Sandwich":
        return FoodDictionary.allFoods["Sandwich"]!;
      case "14 Egg":
        return FoodDictionary.allFoods["Egg"]!;
      case "15 Pasta":
        return FoodDictionary.allFoods["Pasta"]!;
      case "16 Rice":
        return FoodDictionary.allFoods["Rice"]!;
      case "17 Ice Cream":
        return FoodDictionary.allFoods["Ice Cream"]!;
      case "18 Pizza":
        return FoodDictionary.allFoods["Pizza"]!;
      case "19 Cheese":
        return FoodDictionary.allFoods["Cheese"]!;
      default:
        return FoodInfo("Null", 0, 0, 0, 0, 0, 0);
    }
  }
  
  @override
  void initState() {
    super.initState();
    _loading = true;
    _loadModel();
  }

  void _loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    ).then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  void _imageSelection() async {
    var imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _loading = true;
      _imageFile = imageFile;
      _image = File(imageFile!.path);
      _imageWidget = Image.file(_image!);
    });
    _imageClasification(imageFile!);
  }

  void _imageClasification(PickedFile image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _listResult = output;
      print(_listResult);
      foodInfo = getCorrespondingFood();
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take a Picture!"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: _image == null
                  ? Text("No images selected")
                  :Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 2),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: _imageWidget,
              ),
            ),
            _listResult != null
                ? Column(
              children: [
                Text(foodInfo!.name),
                Text('${_listResult![0]["confidence"]}'),
                Text(foodInfo!.calories.toString()),
                Text(foodInfo!.cholesterol.toString()),
                Text(foodInfo!.fat.toString()),
                Text(foodInfo!.carbohydrates.toString())
              ],
            )
                : Container(),
            FloatingActionButton(
              heroTag: null,
              onPressed: _imageSelection,
              child: Icon(Icons.add)
            ),
            if(foodInfo!=null)
              FloatingActionButton(
                heroTag: null,
                onPressed: (){
                  RecordedData.foods.add(getCorrespondingFood());
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Meal()));
                },
                child: Icon(Icons.check)
              )
          ],
        ),
      ),
    );
  }
}
