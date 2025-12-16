import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/foto.dart';
import '../provider/foto_provider.dart';

class FotoController{
  final FotoProvider provider;
  final ImagePicker picker = ImagePicker();

  FotoController(this.provider);

  //metodo para tomar foto
  Future<void> tomarFoto(BuildContext context) async {
    final XFile? foto = await picker.pickImage(source: ImageSource.camera);
    //si la foto no es null

    if (foto != null) {
      provider.agregarFoto(
          Foto(path: foto.path,
              nombre: "Foto ${provider.fotos.length}",
              descripcion: "Foto guardad")
      );
      // notificacion local
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Foto guardada de forma correcta!! :D"),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}