class SpecializationModel {
  final int id;
  final String name;

  SpecializationModel({
    required this.id,
    required this.name,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return SpecializationModel(id: 0, name: '');
    }

    return SpecializationModel(
      id: int.tryParse('${json['id'] ?? ''}') ?? 0,
      name: '${json['name'] ?? ''}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}