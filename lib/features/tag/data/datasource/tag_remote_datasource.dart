import 'package:study_flutter/features/tag/data/model/tag_model.dart';

abstract class TagRemoteDataSource {
  /// Create a new tag in Firestore
  Future<TagModel> createTag(TagModel tag);

  /// Get all tags from Firestore
  Future<List<TagModel>> getTags();

  /// Get a specific tag by ID
  Future<TagModel> getTagById(String tagId);

  /// Update an existing tag
  Future<TagModel> updateTag(TagModel tag);

  /// Delete a tag by ID
  Future<void> deleteTag(String tagId);
}
