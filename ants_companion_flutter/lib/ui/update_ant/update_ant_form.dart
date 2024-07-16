import 'package:ants_companion_client/ants_companion_client.dart' as client;
import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/common/sanitize_string.dart';
import 'package:ants_companion_flutter/core/snackbar_service.dart';
import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:ants_companion_flutter/domain/exceptions/exceptions.dart';
import 'package:ants_companion_flutter/ui/widgets/custom_file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UpdateAntForm extends StatefulWidget {
  const UpdateAntForm({super.key, required this.ant});

  final Ant ant;

  @override
  State<UpdateAntForm> createState() => _UpdateAntFormState();
}

class _UpdateAntFormState extends State<UpdateAntForm> {
  final Ants _ants = GetIt.I<Ants>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final logger = appLogger(UpdateAntForm);

  AntType? _selectedAntType;

  final client.Client _client = GetIt.I();

  String? _publicUrl;
  // http://localhost:8080/serverpod_cloud_storage?method=file&path=android-chrome-192x192.png

  @override
  void initState() {
    _nameController.text = widget.ant.name;
    _descriptionController.text = widget.ant.description;
    _publicUrl = widget.ant.profilePictureUrl;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _updateAnt() async {
    try {
      final updatedAnt = await _ants.updateAnt(
        widget.ant.copyWith(
          name: _nameController.value.text,
          description: _descriptionController.value.text,
        ),
      );
      SnackbarService().showSnackbar(
        'Updated ant ${updatedAnt.toString()}',
        type: SnackbarType.info,
      );
      if (!context.mounted) return;
      Navigator.of(context).pop();
    } on AppException catch (e, s) {
      logger.e(e.message, stackTrace: s);
      SnackbarService().showSnackbar(e.toString());
    } catch (e) {
      SnackbarService().showSnackbar(e.toString());
    }
  }

  onFilePicked(PlatformFile file) async {
    final response = await _ants.setAntProfilePicture(
      widget.ant.id,
      file.name,
      file,
    );
    setState(() {
      _publicUrl = response;
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _updateAnt();
    }
  }

  updateAntType(AntType? type) => setState(() {
        _selectedAntType = type;
      });

  @override
  Widget build(BuildContext context) {
    final form = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Profile Image'),
          if (_publicUrl != null) Image.network(_publicUrl!),
          Align(
            alignment: Alignment.bottomLeft,
            child: CustomFilePicker(onPicked: onFilePicked),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            maxLength: 40,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the ants name';
              }
              return null;
            },
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            minLines: 1,
            maxLines: 5,
            maxLength: 250,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              final sanitizedValue = sanitizeString(value);
              if (sanitizedValue.length < 8) {
                return 'Description must be more than 8 characters';
              }
              return null;
            },
          ),
          // DropdownButtonFormField(
          //   items: [],
          //   onChanged: (value) {},
          //   decoration: InputDecoration(
          //     labelText: 'Select Position',
          //   ),
          // ),
          // MultiSelectDropdown<String>(
          //   items: AntRole.values.map((e) => e.name).toList(),
          //   selectedItems: ['meleess'],
          //   onSelectionChanged: (value) {},
          //   displayItem: (value) => value,
          // ),
          // SelectOneDropdown<AntType>(
          //   labelText: 'Type',
          //   items: AntType.values,
          //   selected: _selectedAntType,
          //   onSelectionChanged: updateAntType,
          //   displayItem: (v) => v.name,
          //   validator: (value) {
          //     if (value == null) {
          //       return 'Please select a role';
          //     }
          //     return null;
          //   },
          // ),

          // MultiSelect<String>(
          //   controller: MultiSelectController()..setItems(['a', 'b', 'c']),
          //   label: 'label',
          //   itemLabel: (v) => Text(v),
          //   overlayTitle: 'overlayTitle',
          // ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _submitForm, child: const Text('Submit')),
        ],
      ),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth > 650.0 ? 650.0 : constraints.maxWidth,
            padding: const EdgeInsets.all(16.0),
            child: form,
          ),
        );
      },
    );
  }
}
