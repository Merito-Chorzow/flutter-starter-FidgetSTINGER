import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../models/journal_entry.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';
import '../services/image_service.dart';

class AddEntryView extends StatefulWidget {
  const AddEntryView({super.key});

  @override
  State<AddEntryView> createState() => _AddEntryViewState();
}

class _AddEntryViewState extends State<AddEntryView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ApiService _apiService = ApiService();
  final LocationService _locationService = LocationService();
  final ImageService _imageService = ImageService();

  Position? _currentPosition;
  XFile? _selectedImage;
  bool _isLoading = false;

  Future<void> _getLocation() async {
    setState(() => _isLoading = true);
    try {
      final position = await _locationService.getCurrentLocation();
      setState(() => _currentPosition = position);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd lokalizacji: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getImage(bool fromCamera) async {
    try {
      final image = fromCamera
          ? await _imageService.pickImageFromCamera()
          : await _imageService.pickImageFromGallery();
      if (image != null) {
        setState(() => _selectedImage = image);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd zdjęcia: $e')),
      );
    }
  }

  Future<void> _saveEntry() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final newEntry = JournalEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        date: DateTime.now(),
        latitude: _currentPosition?.latitude,
        longitude: _currentPosition?.longitude,
        imagePath: _selectedImage?.path,
      );

      await _apiService.addEntry(newEntry);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd zapisu: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dodaj wpis')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Tytuł'),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Podaj tytuł' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(labelText: 'Opis'),
                      maxLines: 3,
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Podaj opis' : null,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _getLocation,
                          icon: const Icon(Icons.location_on),
                          label: const Text('Lokalizacja'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _getImage(true),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Aparat'),
                        ),
                      ],
                    ),
                    if (_currentPosition != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Lokalizacja: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (_selectedImage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image.file(
                          File(_selectedImage!.path),
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _saveEntry,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('ZAPISZ WPIS'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
