import 'package:equatable/equatable.dart';

class Theme extends Equatable{
  final String themeId;
  final String name;

  const Theme({required this.themeId, required this.name});

  Theme copyWith({String? themeId,
  String? name}) {
    return Theme(themeId: themeId ?? this.themeId,
    name: name ?? this.name,);
    
  }

  @override
  List<Object?> get props => [themeId, name];
}
