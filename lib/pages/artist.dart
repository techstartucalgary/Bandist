class Employee {
  final String artist_id;
  // final String eemail;
  final String name;
  final List concert;


  Employee({this.artist_id='000', 
  // this.eemail='', 
  this.name='',
  required this.concert,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      artist_id: json['artist_id'],
      name: json['name'],
      concert: json['concert'],

      // eemail: json['eemail'],
    );
  }

  Map<String, dynamic> toJson() => {
    'spotify_id' : artist_id,
    'name': name,
    'concert': concert,
    // 'eemail': eemail,
  };
}