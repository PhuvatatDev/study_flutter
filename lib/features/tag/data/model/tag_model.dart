import 'package:study_flutter/features/tag/entities/tag.dart';

class TagModel extends Tag {
  const TagModel({required super.tagId, required super.name});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(tagId: json['tagId'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'tagId': tagId, 'name': name};
  }

  factory TagModel.fromEntity(Tag tag) {
    return TagModel(tagId: tag.tagId, name: tag.name);
  }
}
