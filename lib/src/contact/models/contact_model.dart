class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();
}


class Contact {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;

  Contact.fromMap(Map map) {
    id = map["id"];
    name = map["contact_name"];
    email = map["contact_email"];
    phone = map["contact_phone"];
    image = map["contact_image"]; 
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "contact_name": name,
      "contact_email": email,
      "contact_phone": phone,
      "contact_image": image
    };

    return map;
  }

  
}