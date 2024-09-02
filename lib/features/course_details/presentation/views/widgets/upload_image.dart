import 'package:warsha/core/helpers/common_imports.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.onImageSelected});

  final ValueChanged<File?> onImageSelected;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImageFromGallery();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: selectedImage == null
            ? AspectRatio(
                aspectRatio: 1.6,
                child: DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 2.w,
                  dashPattern: const [10, 6],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12.w),
                  child: Center(
                    child: Icon(
                      Icons.upload_file,
                      size: 50.w,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12.w),
                child: Image.file(
                  selectedImage!,
                ),
              ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(image!.path);
      widget.onImageSelected(selectedImage);
    });
  }
}
