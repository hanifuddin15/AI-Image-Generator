import 'dart:convert';

import 'package:ai_image_generator/services/open_ai_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AiImageGeneratorController extends GetxController{

  var textEditingController =  TextEditingController();
  var image =<Image>[].obs;
    var images = "";
  var sizes = ["Small", "Medium", "Large"];
  var sizevalues = ["256×256", "512×512", "1024×1024"];
  String? dropValues;
  var isLoading = true.obs;
void fetchImage() async {
    isLoading(true);

    try {
      isLoading(true);
      if (textEditingController.text.isNotEmpty && dropValues!.isNotEmpty){
      var imageTemp = await OpenAiImageApiService.generateImage(textEditingController.text, dropValues!);
     
      }
      
    } catch(e){
      print(e);
       Get.snackbar('Error', 'Error from exception: '+ e.toString() );
    }
    
    finally {
      isLoading(false);
    }
  }
 @override
  void onInit() {
    super.onInit();
    fetchImage();
  }
}
//if (imagegeneratorcontroller.textEditingController.text.isNotEmpty && imagegeneratorcontroller.dropValues!.isNotEmpty){
// imagegeneratorcontroller.image = OpenAiImageApiService.generateImage(imagegeneratorcontroller.textEditingController.text, imagegeneratorcontroller.dropValues!);
                               
//                                 }
//                                 else{
                           
 
//     Get.snackbar('Ai Image', 'Image Generation Error');
//                                 }