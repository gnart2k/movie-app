class ComparePlans {
  final String title;
  final List<String> columns;
  final List<CompareRow> rows;

  ComparePlans({
    required this.title,
    required this.columns,
    required this.rows,
  });

  factory ComparePlans.fromJson(Map<String, dynamic> json) {
    final rows = (json['rows'] as List<dynamic>)
        .map((item) => CompareRow.fromJson(item as Map<String, dynamic>))
        .toList();

    return ComparePlans(
      title: json['title'] as String,
      columns: List<String>.from(json['columns'] as List),
      rows: rows,
    );
  }
}

class CompareRow {
  final String feature;
  final String basic;
  final String standard;
  final String premium;

  CompareRow({
    required this.feature,
    required this.basic,
    required this.standard,
    required this.premium,
  });

  factory CompareRow.fromJson(Map<String, dynamic> json) {
    return CompareRow(
      feature: json['feature'] as String,
      basic: json['basic'] as String,
      standard: json['standard'] as String,
      premium: json['premium'] as String,
    );
  }
}