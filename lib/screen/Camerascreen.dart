// ignore: file_names
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
 List<CameraDescription> Cameras = " " as List<CameraDescription>;

class Camerascreen extends StatefulWidget {
  Camerascreen({Key?key}): super(key: key);
  @override
  _CamerascreenState createState() => _CamerascreenState();
}

class _CamerascreenState extends State<Camerascreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController= CameraController(Cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder( future: cameraValue,
              builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done)
              {
                return CameraPreview(_cameraController);
              } else
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
          }),
          Positioned(
            bottom:0.0,
            child: Container(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize:MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.flash_off,color: Colors.white,size: 28,),),
                      InkWell(onTap: (){}, child: Icon(Icons.panorama_fish_eye,color: Colors.white,size: 70,),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.flip_camera_ios,color: Colors.white,size: 28,),)
                    ],
                  ),

                  Text("Hold for video, Tap for photo",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
