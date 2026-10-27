import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; 

class Edit extends StatefulWidget {
  final File image;

  const Edit({Key? key, required this.image}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late File originalImageFile;
  Uint8List? processedImageBytes;
  bool isGrayscaleApplied = false;

  @override
  void initState() {
    super.initState();
    originalImageFile = widget.image;
    _loadInitialImage();
  }   

  Future<void> _loadInitialImage() async {
    final bytes = await originalImageFile.readAsBytes();
    setState(() {
      processedImageBytes = bytes; 
    });
  }

  Future<void> _applyGrayscale() async {
    final originalBytes = await originalImageFile.readAsBytes();
    img.Image? decodedImage = img.decodeImage(originalBytes);
    if (decodedImage != null) {
      img.Image grayscaleImage = img.grayscale(decodedImage);
      setState(() {
        processedImageBytes = Uint8List.fromList(img.encodeJpg(grayscaleImage));
        isGrayscaleApplied = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Edit Image'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: processedImageBytes == null
                      ? const Center(child: CircularProgressIndicator())
                      : BeforeAfterSlider(
                          originalImageFile: originalImageFile,
                          processedImageBytes: processedImageBytes!,
                        ),
                ),
              ),
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _applyGrayscale,
                    icon: const Icon(Icons.color_lens),
                    label: Text(isGrayscaleApplied ? 'Grayscale Applied' : 'Apply Grayscale'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(235, 221, 255, 1),
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== ويدجت السلايدر (Before/After) ====================

class BeforeAfterSlider extends StatefulWidget {
  final File originalImageFile;
  final Uint8List processedImageBytes;

  const BeforeAfterSlider({
    Key? key,
    required this.originalImageFile,
    required this.processedImageBytes,
  }) : super(key: key);

  @override
  State<BeforeAfterSlider> createState() => _BeforeAfterSliderState();
}

class _BeforeAfterSliderState extends State<BeforeAfterSlider> {
  double _sliderFactor = 0.5; 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _sliderFactor += details.delta.dx / width;
              _sliderFactor = _sliderFactor.clamp(0.0, 1.0);
            });
          },
          child: Container(
            width: width,
            height: height,
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [

                Image.file(
                  widget.originalImageFile,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),

                ClipRect(
                  clipper: _SliderClipper(splitFactor: _sliderFactor),
                  child: Image.memory(
                    widget.processedImageBytes,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 0,
                  bottom: 0,
                  left: width * _sliderFactor - 1,
                  child: Container(
                    width: 2,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.swap_horiz,
                          size: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: _buildBadge('Before'),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: _buildBadge('After'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _SliderClipper extends CustomClipper<Rect> {
  final double splitFactor;

  _SliderClipper({required this.splitFactor});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      size.width * splitFactor,
      0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(covariant _SliderClipper oldClipper) {
    return oldClipper.splitFactor != splitFactor;
  }
}