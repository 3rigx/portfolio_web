import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../components/sections/navigation_bar.dart';

class Experiments extends StatefulWidget {
  const Experiments({super.key});

  @override
  State<Experiments> createState() => _ExperimentsState();
}

class _ExperimentsState extends State<Experiments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavigationBarNew(context),
          const Center(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: ModelViewer(
                src: 'assets/3dmodel/diamond.glb', // Update path to use assets/
                alt: "A 3D model",
                ar: true,
                autoRotate: true,
                cameraControls: true,
                shadowIntensity: 1,
                autoPlay: true,
                backgroundColor:
                    Colors.transparent, // Add this for better integration
                loading: Loading.eager, // Add this to control loading behavior
              ),
            ),
          ),
        ],
      ),
    );
  }
}
