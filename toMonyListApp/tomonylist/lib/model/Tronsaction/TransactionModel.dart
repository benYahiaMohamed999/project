class PaidMonyModel {
  double? amount;
  String? description;
  String? dateTime;
  int? id; // Make id nullable if not always present

  // Constructor with optional id parameter
  PaidMonyModel({this.amount, this.description, this.dateTime,this.id});

  // Named constructor for mapping from dynamic object
  PaidMonyModel.map(dynamic obj) {
    amount = obj['amount'] ?? 0.0; // Default to 0.0 if null
    description = obj['description'] ?? 'No Description'; // Default description
    dateTime = obj['dateTime'] ?? DateTime.now().toIso8601String(); // Current date as default
    id = obj['id']; // id can remain null if not provided
  }

  // Getters without underscore
  double get getAmount => amount!;
  String get getDescription => description!;
  String get getDate => dateTime!;
  int? get getId => id; // Nullable id

  // Convert to a Map for database storage or JSON
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id':id,
      'amount': amount,
      'description': description,
      'dateTime': dateTime,
    };
    
    if (id != null) {
      map['id'] = id; // Only include if id is not null
    }
    
    return map;
  }

  // Named constructor to create an instance from a Map
  PaidMonyModel.fromMap(Map<String, dynamic> map) 
      : amount = map['amount'],
        description = map['description'],
        dateTime = map['date'],
        id = map['id']; // Include id as well
}