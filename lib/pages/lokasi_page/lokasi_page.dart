import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'lokasi_page_controller.dart';
import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';
import 'package:witt/witt.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final lokasiPC = WService.get<LokasiPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentukan Lokasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: GoogleMap(
                  initialCameraPosition: lokasiPC.initialCamera,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (newController) =>
                      lokasiPC.onMapCreated(newController),
                  markers: const {},
                ),
              ),
            ),
            const SizedBox(height: 16),
            BigButton(
              label: "Tentukan",
              onPrimary: palette.onSecondary,
              width: double.infinity,
              onPressed: () => lokasiPC.tentukaButton(),
            ),
          ],
        ),
      ),
    );
  }
}
