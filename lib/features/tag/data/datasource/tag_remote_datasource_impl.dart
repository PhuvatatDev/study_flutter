import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_flutter/features/tag/data/datasource/tag_remote_datasource.dart';
import 'package:study_flutter/features/tag/data/model/tag_model.dart';

class TagRemoteDataSourceImpl implements TagRemoteDataSource {
  final FirebaseFirestore firestore;

  TagRemoteDataSourceImpl({required this.firestore});

  @override
  Future<TagModel> createTag(TagModel tag) async {
    await firestore.collection('tags').doc(tag.tagId).set(tag.toJson());
    return tag;
  }

  @override
  Future<List<TagModel>> getTags() async {
    final snapshot = await firestore.collection('tags').get();
    return snapshot.docs.map((doc) => TagModel.fromJson(doc.data())).toList();
  }

  @override
  Future<TagModel> getTagById(String tagId) async {
    final doc = await firestore.collection('tags').doc(tagId).get();
    if (!doc.exists) {
      throw Exception('Tag not found');
    }
    return TagModel.fromJson(doc.data()!);
  }

  @override
  Future<TagModel> updateTag(TagModel tag) async {
    await firestore.collection('tags').doc(tag.tagId).update(tag.toJson());
    return tag;
  }

  @override
  Future<void> deleteTag(String tagId) async {
    await firestore.collection('tags').doc(tagId).delete();
  }
}
