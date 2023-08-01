class CropResizeArgs {
  final String sourcePath;
  final String destPath;
  final double aspectRatio;
  final int width;
  final int quality;

  CropResizeArgs({
    required this.sourcePath,
    required this.destPath,
    required this.aspectRatio,
    required this.width,
    required this.quality,

  });
}