import 'package:agenda_flutter/database/database_manager.dart';
import 'package:agenda_flutter/src/contact/models/contact_model.dart';

class ContactRepository {
  final databaseManager = DatabaseManager.internal();

  Future<Contact>saveContact(Contact contact) async {
    final db = await databaseManager.db;

    contact.id = await db.insert('contact', contact.toMap());

    return contact;
  }

  Future<Contact> getContact(int id) async {
    final db = await databaseManager.db;

    List<Map> records = await db.query(
      'contacts', 
      columns: ['contact_name', 'contact_email', 'contact_phone', 'contact_image'],
      where: "id = ?",
      whereArgs: [id],
    );

    if (records.length > 0) {
      return Contact.fromMap(records.first); 
    }
    else {
      return Contact();
    }
  }
  
}