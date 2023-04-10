class Employee {
  final String spotify_id;
  // final String eemail;
  // final String ename;


  Employee({this.spotify_id='000', 
  // this.eemail='', this.ename=''
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      spotify_id: json['spotify_id'],
      // ename: json['ename'],
      // eemail: json['eemail'],
    );
  }

  Map<String, dynamic> toJson() => {
    'spotify_id' : spotify_id,
    // 'ename': ename,
    // 'eemail': eemail,
  };
}