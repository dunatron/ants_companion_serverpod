import 'package:ants_companion_flutter/common/sanitize_string.dart';
import 'package:ants_companion_flutter/domain/ants.dart';
import 'package:ants_companion_flutter/domain/models/ant.dart';
import 'package:ants_companion_flutter/domain/models/ant_type.dart';
import 'package:ants_companion_flutter/ui/inputs/multi_select/multi_select.dart';
import 'package:ants_companion_flutter/ui/inputs/multi_select/multi_select_controller.dart';
import 'package:ants_companion_flutter/ui/inputs/multi_select_dropdown.dart';
import 'package:ants_companion_flutter/ui/inputs/select_one_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CreateAntForm extends StatefulWidget {
  const CreateAntForm({super.key});

  @override
  State<CreateAntForm> createState() => _CreateAntFormState();
}

class _CreateAntFormState extends State<CreateAntForm> {
  final Ants _ants = GetIt.I<Ants>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _passwordController = TextEditingController();

  AntType? _selectedAntType;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _createAnt() async {
    _ants.createAnt(
      Ant.createNew(
        name: sanitizeString(_nameController.text),
        description: sanitizeString(_descriptionController.text),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _createAnt();
    }
  }

  updateAntType(AntType? type) => setState(() {
        _selectedAntType = type;
      });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth > 650.0 ? 650.0 : constraints.maxWidth,
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
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
                  SelectOneDropdown<AntType>(
                    labelText: 'Type',
                    items: AntType.values,
                    selected: _selectedAntType,
                    onSelectionChanged: updateAntType,
                    displayItem: (v) => v.name,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a role';
                      }
                      return null;
                    },
                  ),

                  MultiSelect<String>(
                    controller: MultiSelectController()
                      ..setItems(['a', 'b', 'c']),
                    label: 'label',
                    itemLabel: (v) => Text(v),
                    overlayTitle: 'overlayTitle',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: _submitForm, child: const Text('Submit')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
