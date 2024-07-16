import 'package:ants_companion_flutter/common/sanitize_string.dart';
import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:ants_companion_flutter/domain/tier_tags/tier_tags.dart';
import 'package:ants_companion_flutter/ui/inputs/select_one_dropdown.dart';
import 'package:ants_companion_flutter/ui/pickers/ant_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CreateTierTagForm extends StatefulWidget {
  const CreateTierTagForm({super.key});

  @override
  State<CreateTierTagForm> createState() => _CreateTierTagFormState();
}

class _CreateTierTagFormState extends State<CreateTierTagForm> {
  final Ants _ants = GetIt.I<Ants>();

  final TierTags _tierTags = GetIt.I<TierTags>();

  final _formKey = GlobalKey<FormState>();

  Ant? _selectedAnt;
  LineupPosition? _selectedLineupPosition = LineupPosition.front;
  String? _selectedTagType = 'PVP';
  TierRating? _selectedTierRating = TierRating.f;
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();

    super.dispose();
  }

  Future<void> _createTierTag() async {
    final tierTag = switch (_selectedTagType) {
      'PVE' => AntPveTierTag(
          antId: _selectedAnt!.id,
          rating: _selectedTierRating!,
          reason: _reasonController.text,
          lineupPosition: _selectedLineupPosition!,
        ),
      'PVP' => AntPvpTierTag(
          antId: _selectedAnt!.id,
          rating: _selectedTierRating!,
          reason: _reasonController.text,
          lineupPosition: _selectedLineupPosition!,
        ),
      _ => throw UnimplementedError(),
    };

    try {
      await _tierTags.create(tierTag);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _createTierTag();
    }
  }

  updateSelectedAnt(Ant? ant) => setState(() {
        _selectedAnt = ant;
      });

  updateSelectedTagType(String? tagType) => setState(() {
        _selectedTagType = tagType;
      });

  updateSelectedLineupPosition(LineupPosition? lineupPosition) => setState(() {
        _selectedLineupPosition = lineupPosition;
      });

  updateSelectedTierRating(TierRating? tierRating) => setState(() {
        _selectedTierRating = tierRating;
      });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth > 650.0 ? 650.0 : constraints.maxWidth,
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  AntPicker(
                    selected: _selectedAnt,
                    onChange: updateSelectedAnt,
                  ),
                  SelectOneDropdown<String>(
                    labelText: 'Tag Type',
                    items: const ['PVP', 'PVE'],
                    selected: _selectedTagType,
                    onSelectionChanged: updateSelectedTagType,
                    displayItem: (v) => v,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a tag type';
                      }
                      return null;
                    },
                  ),
                  SelectOneDropdown<LineupPosition>(
                    labelText: 'Lineup position',
                    items: LineupPosition.values,
                    selected: _selectedLineupPosition,
                    onSelectionChanged: updateSelectedLineupPosition,
                    displayItem: (v) => v.name,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a position';
                      }
                      return null;
                    },
                  ),
                  SelectOneDropdown<TierRating>(
                    labelText: 'Tier',
                    items: TierRating.values,
                    selected: _selectedTierRating,
                    onSelectionChanged: updateSelectedTierRating,
                    displayItem: (v) => v.name,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a tier rating';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _reasonController,
                    decoration: const InputDecoration(labelText: 'Reason'),
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 250,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a reason';
                      }
                      final sanitizedValue = sanitizeString(value);
                      if (sanitizedValue.length < 8) {
                        return 'Reason must be more than 8 characters';
                      }
                      return null;
                    },
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
