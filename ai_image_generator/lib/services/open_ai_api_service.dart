import 'dart:convert';


import 'package:ai_image_generator/controller/ai_image_generator_controller.dart';
import 'package:ai_image_generator/core/keys/api-key.dart';
import 'package:ai_image_generator/utilities/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/image_model.dart';

class OpenAiImageApiService {
  static var client = http.Client();
  static final AiImageGeneratorController imagecontroller = Get.find();
static final String prompt = Uri.encodeQueryComponent(imagecontroller.textEditingController.text);
 static final String batch_size = '1';
static final  url = Uri.parse("${Urls.imagegeneratorBaseUrl}?$prompt=$prompt&batch_size=1 ");
static List<Image>? generatedImage =[];
 static final Map<String, String> headers = {
      'X-Rapidapi-Key': 'a587c7bec3msh0dc2ecb0164550bp156e35jsn87625a98bdbd',
      'X-Rapidapi-Host': 'text-to-image7.p.rapidapi.com',
    };

    static generateImage(String text, String size) async {
    var response = await client.get(url, 
    headers: headers,
    
    
    // body: jsonEncode({
    //   "model": "dall-e-3",
    // "prompt": text,
    // "n": 1,
    // "size": size}
    // )
    );

    if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body.toString());
//       print(jsonData);
//      //return jsonData ['data'][0]['url'];
// ImageModel imageModel = ImageModel.fromJson(jsonData);
// generatedImage = imageModel.data!;
// Get.put(ImageModel());
 final Map<String, dynamic> data = json.decode(response.body);
      // Handle the response data here
      print(data);
      
    } else {
      return ("Failed to fetch data");
    }
  }
}
