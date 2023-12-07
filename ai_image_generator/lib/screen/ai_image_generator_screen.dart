import 'package:ai_image_generator/controller/ai_image_generator_controller.dart';
import 'package:ai_image_generator/core/values/colors.dart';
import 'package:ai_image_generator/services/open_ai_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AiImageGeneratorScreen extends StatelessWidget {
  const AiImageGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiImageGeneratorController>(
      init: AiImageGeneratorController(),
      // initState: (AiImageGeneratorController) {},
      builder: (imagegeneratorcontroller) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            leading: const Image(
              image: AssetImage("images/My A!rt Logo.png"),
              height: 100,
              width: 100,
            ),
            title: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('My A!rt'),
            ),
          ),
          body: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverToBoxAdapter(
                  child: Container(
                      decoration: const BoxDecoration(
                          //color: AppColors.mainColor
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Put Your Text in The Text Prompt to Generate Image:"
                                .tr,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          
                          Container(
                            height: 70,
                            child: TextField(
                             controller: imagegeneratorcontroller.textEditingController,
                              maxLines: null, //by hanif
                              onChanged: (s) {
                                 imagegeneratorcontroller.textEditingController;
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        // controller.eraseAdvicetoPatient();
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      )),
                                  labelText: "Text to Image Generator",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(height:20),
                          Container(
                             
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 30,),
                            decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                            ),
                              child: Row(
                            children: [
                              
                              DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                icon: const Icon(Icons.expand_more),
                                value: imagegeneratorcontroller.dropValues,
                                hint: const Text("Select Size"),
                                items: List.generate(
                                    imagegeneratorcontroller.sizes.length,
                                    (index) => DropdownMenuItem(
                                          child: Text(imagegeneratorcontroller
                                              .sizes[index]),
                                          value: imagegeneratorcontroller
                                              .sizevalues,
                                        )),
                                onChanged: ( value) {
                                  imagegeneratorcontroller
                                  .dropValues = value.toString();
                                },
                              )),
                              SizedBox(width:10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),primary: AppColors.mainColor),
                              onPressed:  ()async{
//                                 if (imagegeneratorcontroller.textEditingController.text.isNotEmpty && imagegeneratorcontroller.dropValues!.isNotEmpty){
// imagegeneratorcontroller.image = OpenAiImageApiService.generateImage(imagegeneratorcontroller.textEditingController.text, imagegeneratorcontroller.dropValues!);
                               
//                                 }
//                                 else{
                           
 
//     Get.snackbar('Ai Image', 'Image Generation Error');
//                                 }
imagegeneratorcontroller.fetchImage();

                              },
                              child: //controller.isLoading ? 
                              // const ColorfulCircularProgressIndicator(colors: [
                              //   Colors.blue, Colors.red, Colors.green, Colors.yellow
                              // ]) :
                               Text("Click to Generate".tr,style: const TextStyle(color: Colors.white),),
                            ),
                            Expanded(
                              child: Image.network(imagegeneratorcontroller.image.toString()),
                              flex: 4,
                            ),
                          
                            ],
                          ))
                        ],
                      ))),
            ],
          ),
        ));
      },
    );
  }
}
