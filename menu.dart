import 'dart:io';

// Enum for Opportunity Status
enum OpportunityStatus {
  active,
  completed,
}

// Enum for Opportunity Category
enum OpportunityCategory {
  education,
  medicalHelp,
  environment,
  relief,
  others,
}

// 1. Dart Classes: User, Opportunity, Organization, and Accomplishment

class User {
  String _name;
  String _username;
  String _password;
  String? _location;
  String? _profilePicture;

  User({
    required String name,
    required String username,
    required String password,
    String? location,
    String? profilePicture,
  })  : _name = name,
        _username = username,
        _password = password,
        _location = location,
        _profilePicture = profilePicture;

  // Getters
  String get name => _name;
  String get username => _username;
  String get password => _password;
  String? get location => _location;
  String? get profilePicture => _profilePicture;

  // Setters
  set name(String name) => _name = name;
  set username(String username) => _username = username;
  set password(String password) => _password = password;
  set location(String? location) => _location = location;
  set profilePicture(String? profilePicture) => _profilePicture = profilePicture;

  void displayUserInfo() {
    print('Name: $_name');
    print('Username: $_username');
    if (_location != null) print('Location: $_location');
    if (_profilePicture != null) print('Profile Picture: $_profilePicture');
  }
}

class Opportunity {
  String _title;
  String _description;
  OpportunityCategory _category;
  String _imageUrl;
  OpportunityStatus _status;

  Opportunity({
    required String title,
    required String description,
    required OpportunityCategory category,
    required String imageUrl,
    OpportunityStatus status = OpportunityStatus.active,
  })  : _title = title,
        _description = description,
        _category = category,
        _imageUrl = imageUrl,
        _status = status;

  // Getters
  String get title => _title;
  String get description => _description;
  OpportunityCategory get category => _category;
  String get imageUrl => _imageUrl;
  OpportunityStatus get status => _status;

  // Setters
  set title(String title) => _title = title;
  set description(String description) => _description = description;
  set category(OpportunityCategory category) => _category = category;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;
  set status(OpportunityStatus status) => _status = status;

  void displayOpportunity() {
    print('---------------------------------------');
    print('Title: $_title');
    print('Category: ${_category.toString().split('.').last}');
    print('Description: $_description');
    print('Status: ${_status.toString().split('.').last}');
    print('---------------------------------------');
  }
}

class Accomplishment {
  String _title;
  String _description;
  String _imageUrl;

  Accomplishment({
    required String title,
    required String description,
    required String imageUrl,
  })  : _title = title,
        _description = description,
        _imageUrl = imageUrl;

  // Getters
  String get title => _title;
  String get description => _description;
  String get imageUrl => _imageUrl;

  // Setters
  set title(String title) => _title = title;
  set description(String description) => _description = description;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  void displayAccomplishment() {
    print('Accomplishment: $_title');
    print('Description: $_description');
  }
}

// 2. Sample Data and Lists
List<Opportunity> opportunities = [];

Accomplishment accomplishment = Accomplishment(
  title: "Accomplishment of the Week",
  description: "Raised 10 million dollars to rebuild children's hospitals!",
  imageUrl: "assets/accomplishment_image.jpg",
);


void main() {
  while (true) {
    print('\n====== Volunteer Opportunity Console Menu ======');
    print('1. Display All Opportunities');
    print('2. Add New Opportunity');
    print('3. Update Opportunity');
    print('4. Delete Opportunity');
    print('5. Search Opportunities by Category');
    print('6. Exit');
    stdout.write('Select an option (1-6): ');

    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        displayOpportunities();
        break;
      case '2':
        handleAddOpportunity();
        break;
      case '3':
        handleUpdateOpportunity();
        break;
      case '4':
        handleDeleteOpportunity();
        break;
      case '5':
        handleSearchOpportunity();
        break;
      case '6':
        print('Exiting program. Goodbye!');
        return;
      default:
        print('Invalid option. Please choose between 1-6.');
    }
  }
}

// Functions

void displayOpportunities() {
  print("\n--- All Volunteer Opportunities ---");
  if (opportunities.isEmpty) {
    print("No opportunities available.");
  } else {
    for (var op in opportunities) {
      op.displayOpportunity();
    }
  }
}

void handleAddOpportunity() {
  try {
    stdout.write('Enter Title: ');
    String title = stdin.readLineSync()!;

    stdout.write('Enter Description: ');
    String description = stdin.readLineSync()!;

    stdout.write('Enter Category (education, medicalHelp, environment, relief, others): ');
    String categoryInput = stdin.readLineSync()!.toLowerCase();

    OpportunityCategory category = OpportunityCategory.values.firstWhere(
            (e) => e.toString().split('.').last.toLowerCase() == categoryInput);

    addOpportunity(
      title: title,
      description: description,
      category: category,
      imageUrl: 'assets/default.jpg',
    );
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

void handleUpdateOpportunity() {
  try {
    stdout.write('Enter Title of Opportunity to Update: ');
    String oldTitle = stdin.readLineSync()!;
    stdout.write('Enter New Title: ');
    String newTitle = stdin.readLineSync()!;
    stdout.write('Enter New Description: ');
    String newDesc = stdin.readLineSync()!;
    updateOpportunity(oldTitle, newTitle, newDesc);
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

void handleDeleteOpportunity() {
  try {
    stdout.write('Enter Title of Opportunity to Delete: ');
    String title = stdin.readLineSync()!;
    stdout.write('Are you sure? (yes/no): ');
    String confirm = stdin.readLineSync()!;
    if (confirm.toLowerCase() == 'yes') {
      deleteOpportunity(title);
    } else {
      print('Deletion cancelled.');
    }
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

void handleSearchOpportunity() {
  try {
    stdout.write('Enter Category to Search: ');
    String categoryInput = stdin.readLineSync()!.toLowerCase();
    OpportunityCategory category = OpportunityCategory.values.firstWhere(
            (e) => e.toString().split('.').last.toLowerCase() == categoryInput);
    searchOpportunity(category);
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

// Data Operation Functions

void addOpportunity({
  required String title,
  required String description,
  required OpportunityCategory category,
  required String imageUrl,
  OpportunityStatus status = OpportunityStatus.active,
}) {
  Opportunity newOpportunity = Opportunity(
    title: title,
    description: description,
    category: category,
    imageUrl: imageUrl,
    status: status,
  );
  opportunities.add(newOpportunity);
  print('Opportunity "$title" added!');
}

void updateOpportunity(String oldTitle, String newTitle, String newDescription) {
  var opportunity = opportunities.firstWhere((op) => op.title == oldTitle);
  opportunity.title = newTitle;
  opportunity.description = newDescription;
  print('Opportunity updated: $newTitle');
}

void deleteOpportunity(String title) {
  opportunities.removeWhere((op) => op.title == title);
  print('Opportunity "$title" deleted');
}

void searchOpportunity(OpportunityCategory category) {
  var filtered = opportunities.where((op) => op.category == category).toList();
  if (filtered.isEmpty) {
    print('No opportunities found in this category.');
  } else {
    print("\n--- Opportunities in ${category.toString().split('.').last} ---");
    for (var op in filtered) {
      op.displayOpportunity();
    }
  }
}