import 'package:equatable/equatable.dart';

class Tag extends Equatable{
  final String tagId;
  final String name;

  const Tag({required this.tagId, required this.name});

  Tag copyWith({String? tagId,
  String? name}) {
    return Tag(tagId: tagId ?? this.tagId,
    name: name ?? this.name,);

  }

  @override
  List<Object?> get props => [tagId, name];
}
