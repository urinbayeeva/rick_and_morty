// import 'dart:math';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:medion/domain/models/map/map_model.dart';
// import 'package:medion/presentation/pages/home/widgets/adress_item.dart';
// import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
// import 'package:medion/presentation/styles/theme_wrapper.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapView extends StatefulWidget {
//   const MapView({
//     super.key,
//     required this.locations,
//     required this.companies,
//     this.title = 'address_of_clinic',
//   });
//
//   final String title;
//   final List locations;
//   final List<LocationModel> companies;
//
//   @override
//   State<MapView> createState() => _MapViewState();
// }
//
// class _MapViewState extends State<MapView> {
//   double? userLat;
//   double? userLon;
//
//   @override
//   void initState() {
//     super.initState();
//     _determinePosition();
//   }
//
//   Future<void> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return;
//     }
//
//     final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//     userLat = position.latitude;
//     userLon = position.longitude;
//
//     debugPrint('User Location: $userLat, $userLon');
//   }
//
//   Future<void> openYandexTaxi(double endLat, double endLon) async {
//     final startLat = userLat;
//     final startLon = userLon;
//
//     if (startLat == null || startLon == null) {
//       const defaultLat = 41.2995; // Example default latitude (Tashkent)
//       const defaultLon = 69.2401; // Example default longitude (Tashkent)
//
//       final url = Uri.parse(
//         'https://3.redirect.appmetrica.yandex.com/route?'
//         'start-lat=$defaultLat&start-lon=$defaultLon&'
//         'end-lat=$endLat&end-lon=$endLon&'
//         'appmetrica_tracking_id=1178268795219780156',
//       );
//
//       if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Could not launch Yandex Taxi')),
//         );
//       }
//       return;
//     }
//
//     final url = Uri.parse(
//       'https://3.redirect.appmetrica.yandex.com/route?'
//       'start-lat=$startLat&start-lon=$startLon&'
//       'end-lat=$endLat&end-lon=$endLon&'
//       'appmetrica_tracking_id=1178268795219780156',
//     );
//
//     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Could not launch Yandex Taxi')),
//       );
//     }
//   }
//
//   MapLibreMapController? _mapController;
//
//   @override
//   Widget build(BuildContext context) {
//     return ThemeWrapper(
//       builder: (context, colors, fonts, icons, controller) {
//         return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             elevation: 0,
//             backgroundColor: colors.shade0,
//             foregroundColor: colors.darkMode900,
//             scrolledUnderElevation: 0,
//             leading: WScaleAnimation(
//               child: Icon(Icons.keyboard_arrow_left, size: 32.h),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             title: Text(widget.title.tr(), style: fonts.regularMain),
//           ),
//           body: Stack(
//             children: [
//               MapLibreMap(
//                 styleString: "https://api.maptiler.com/maps/streets/style.json?key=zOfl9oaEMx4fYvLMLh57",
//                 initialCameraPosition: CameraPosition(
//                   target: widget.locations.isNotEmpty
//                       ? widget.locations.first
//                       : const LatLng(41.30796000000004, 69.24320000000006),
//                   zoom: 14.0,
//                 ),
//                 onMapCreated: _onMapCreated,
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   width: 1.sw,
//                   constraints: BoxConstraints(maxHeight: 0.4.sh),
//                   decoration: BoxDecoration(color: colors.shade0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         ...List.generate(
//                           widget.companies.length,
//                           (index) {
//                             final company = widget.companies[index];
//
//                             return AdressItem(
//                               address: company.address,
//                               url: "${company.images}",
//                               onTap: () {
//                                 if (_mapController != null && widget.locations.isNotEmpty) {
//                                   _mapController!.animateCamera(
//                                     CameraUpdate.newLatLngZoom(widget.locations.first, 16.0),
//                                   );
//                                 }
//                               },
//                               yandexOnTap: () {
//                                 openYandexTaxi(company.position.latitude, company.position.longitude);
//                               },
//                               name: "${company.fullName}",
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> _onMapCreated(MapLibreMapController controller) async {
//     _mapController = controller;
//
//     await controller.addImage(
//       "red_marker",
//       await _loadMarkerIcon(color: Colors.red, iconData: Icons.location_on_outlined),
//     );
//     for (LatLng point in widget.locations) {
//       await controller.addSymbol(
//         SymbolOptions(
//           geometry: point,
//           iconImage: "red_marker",
//           iconSize: 1.0,
//         ),
//       );
//     }
//
//     if (widget.locations.isNotEmpty) {
//       await controller.animateCamera(
//         CameraUpdate.newLatLngZoom(widget.locations.first, 14.0),
//       );
//     }
//   }
//
//   Future<Uint8List> _loadMarkerIcon({required Color color, required IconData iconData, double size = 80}) async {
//     final recorder = PictureRecorder();
//     final canvas = Canvas(recorder);
//     final paint = Paint()..color = Colors.transparent;
//
//     final iconSize = size * 0.8;
//
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint);
//
//     final textPainter = TextPainter(textDirection: TextDirection.ltr);
//     textPainter.text = TextSpan(
//       text: String.fromCharCode(iconData.codePoint),
//       style: TextStyle(
//         fontSize: iconSize,
//         fontFamily: iconData.fontFamily,
//         color: color,
//         package: iconData.fontPackage,
//       ),
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset((size - textPainter.width) / 2, (size - textPainter.height) / 2),
//     );
//
//     final picture = recorder.endRecording();
//     final image = await picture.toImage(size.toInt(), size.toInt());
//     final byteData = await image.toByteData(format: ImageByteFormat.png);
//
//     return byteData!.buffer.asUint8List();
//   }
// }
