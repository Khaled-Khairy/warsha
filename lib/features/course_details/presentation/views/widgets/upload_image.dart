import 'package:permission_handler/permission_handler.dart';
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

  _pickImageFromGallery() async {
    var status = await Permission.photos.request();

    if (status.isGranted) {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
          widget.onImageSelected(selectedImage);
        });
      }
    } else if (status.isDenied || status.isPermanentlyDenied) {
      _showPermissionDeniedMessage();
    }
  }

  _showPermissionDeniedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: SnackBarContent(
            message:
                "Permission to access your photo gallery is required to select images. Please enable it in your device settings."),
      ),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () {
        openAppSettings();
      },
    );
  }
}
