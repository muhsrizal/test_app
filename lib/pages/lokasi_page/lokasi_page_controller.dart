import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:witt/witt.dart';

class LokasiPageController extends WDisposable {
  late LocationPermission locationPermission;
  final initialCamera = const CameraPosition(
    target: LatLng(-6.200000, 106.816666),
    zoom: 15,
  );

  late final GoogleMapController googleMapController;

  @override
  void initialize() async {
    locationPermission = await Geolocator.requestPermission();
    super.initialize();
  }

  void onMapCreated(GoogleMapController newController) {
    googleMapController = newController;
  }

  Future<void> tentukaButton() async {
    final currentPosition = await Geolocator.getCurrentPosition();
    // final placeMarkers = await placemarkFromCoordinates(
    //   currentPosition.latitude,
    //   currentPosition.longitude,
    // );

    final lokasi = LatLng(
      currentPosition.latitude,
      currentPosition.longitude,
    );

    // print("Length: ${placeMarkers.length}");
    // print(placeMarkers.first.toJson());
    WRouter.pop(result: lokasi);
  }
}
