import 'dart:io';

// Enums
enum OpportunityStatus {
  active,
  completed,
}

enum OpportunityCategory {
  education,
  medicalHelp,
  environment,
  relief,
  others,
}

// User Class
class User {
  String _name;
  String _username;
  String _password;
  String? _location;
  String? _profilePicture;
  List<Opportunity> _participatedOpportunities = [];

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

  String get name => _name;
  String get username => _username;
  String get password => _password;
  String? get location => _location;
  String? get profilePicture => _profilePicture;
  List<Opportunity> get participatedOpportunities => _participatedOpportunities;

  set name(String value) => _name = value;
  set username(String value) => _username = value;
  set password(String value) => _password = value;
  set location(String? value) => _location = value;
  set profilePicture(String? value) => _profilePicture = value;

  void addParticipation(Opportunity opportunity) {
    _participatedOpportunities.add(opportunity);
    print('$name has signed up for opportunity "${opportunity.title}".');
  }

  void displayUserInfo() {
    print('Name: $_name');
    print('Username: $_username');
    if (_location != null) print('Location: $_location');
    if (_profilePicture != null) print('Profile Picture: $_profilePicture');
  }

  void displayParticipatedOpportunities() {
    if (_participatedOpportunities.isEmpty) {
      print('$name has not participated in any opportunities yet.');
    } else {
      print('$name has participated in:');
      for (var op in _participatedOpportunities) {
        op.displayOpportunity();
      }
    }
  }
}

// Opportunity Class
class Opportunity {
  String _title;
  String _description;
  OpportunityCategory _category;
  String _imageUrl;
  OpportunityStatus _status;
  String _location;
  int _duration;
  int _volunteersNeeded;
  String _requirements;

  Opportunity({
    required String title,
    required String description,
    required OpportunityCategory category,
    required String imageUrl,
    required String location,
    required int duration,
    required int volunteersNeeded,
    required String requirements,
    OpportunityStatus status = OpportunityStatus.active,
  })  : _title = title,
        _description = description,
        _category = category,
        _imageUrl = imageUrl,
        _status = status,
        _location = location,
        _duration = duration,
        _volunteersNeeded = volunteersNeeded,
        _requirements = requirements;

  String get title => _title;
  String get description => _description;
  OpportunityCategory get category => _category;
  String get imageUrl => _imageUrl;
  OpportunityStatus get status => _status;
  String get location => _location;
  int get duration => _duration;
  int get volunteersNeeded => _volunteersNeeded;
  String get requirements => _requirements;

  set title(String value) => _title = value;
  set description(String value) => _description = value;
  set category(OpportunityCategory value) => _category = value;
  set imageUrl(String value) => _imageUrl = value;
  set status(OpportunityStatus value) => _status = value;
  set location(String value) => _location = value;
  set duration(int value) => _duration = value;
  set volunteersNeeded(int value) => _volunteersNeeded = value;
  set requirements(String value) => _requirements = value;

  void displayOpportunity() {
    print('---------------------------------------');
    print('Title: $_title');
    print('Category: ${_category.toString().split('.').last}');
    print('Description: $_description');
    print('Location: $_location');
    print('Duration: $_duration hours/days');
    print('Volunteers Needed: $_volunteersNeeded');
    print('Requirements: $_requirements');
    print('Status: ${_status.toString().split('.').last}');
    print('---------------------------------------');
  }
}

// Organization Class
class Organization {
  String _orgName;
  String _description;
  String _location;
  String _goals;
  String _contactInfo;
  List<Opportunity> _postedOpportunities = [];
  List<String> _newsUpdates = [];

  Organization({
    required String orgName,
    required String description,
    required String location,
    required String contactInfo,
    required String goals,
  })  : _orgName = orgName,
        _description = description,
        _location = location,
        _contactInfo = contactInfo,
        _goals = goals;

  String get orgName => _orgName;
  String get description => _description;
  String get location => _location;
  String get contactInfo => _contactInfo;
  String get goals => _goals;
  List<Opportunity> get postedOpportunities => _postedOpportunities;
  List<String> get newsUpdates => _newsUpdates;

  set orgName(String value) => _orgName = value;
  set description(String value) => _description = value;
  set location(String value) => _location = value;
  set contactInfo(String value) => _contactInfo = value;
  set goals(String value) => _goals = value;

  void addOpportunity(Opportunity opportunity) {
    _postedOpportunities.add(opportunity);
    print('Opportunity "${opportunity.title}" added by $_orgName');
  }

  void addNewsUpdate(String news) {
    _newsUpdates.add(news);
    print('News update added: $news');
  }

  void displayOrganizationInfo() {
    print('Organization: $_orgName');
    print('Location: $_location');
    print('Goals: $_goals');
    print('Contact Info: $_contactInfo');
    print('--- Posted Opportunities ---');
    for (var op in _postedOpportunities) {
      op.displayOpportunity();
    }
    print('--- News Updates ---');
    for (var news in _newsUpdates) {
      print('$news');
    }
  }
}

// Global Lists
List<Opportunity> opportunities = [];
List<User> users = [];
List<Organization> organizations = [];

// Main Function
void main() {
  while (true) {
    print('\n====== Volunteer Console Application Menu ======');
    print('1. Display All Opportunities');
    print('2. Add New Opportunity');
    print('3. Update Opportunity');
    print('4. Delete Opportunity');
    print('5. Search Opportunities by Category');
    print('6. Sign Up a User for an Opportunity');
    print('7. Display User Participation');
    print('8. Exit');
    stdout.write('Choose an option (1-8): ');

    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        displayAllOpportunities();
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
        handleSearchByCategory();
        break;
      case '6':
        handleUserSignUp();
        break;
      case '7':
        handleDisplayUserParticipation();
        break;
      case '8':
        print('Exiting program...');
        return;
      default:
        print('⚠ Invalid option.');
    }
  }
}

// Menu Operations
void displayAllOpportunities() {
  if (opportunities.isEmpty) {
    print('❌ No opportunities available.');
    return;
  }
  print("\n--- All Volunteer Opportunities ---");
  for (var op in opportunities) {
    op.displayOpportunity();
  }
}

void handleAddOpportunity() {
  try {
    stdout.write('Title: ');
    String title = stdin.readLineSync()!;
    stdout.write('Description: ');
    String desc = stdin.readLineSync()!;
    stdout.write('Category (education, medicalHelp, environment, relief, others): ');
    String catInput = stdin.readLineSync()!.toLowerCase();
    OpportunityCategory category = OpportunityCategory.values.firstWhere(
            (e) => e.toString().split('.').last == catInput);

    stdout.write('Image URL: ');
    String imageUrl = stdin.readLineSync()!;
    stdout.write('Location: ');
    String location = stdin.readLineSync()!;
    stdout.write('Duration (in hours/days): ');
    int duration = int.parse(stdin.readLineSync()!);
    stdout.write('Volunteers Needed: ');
    int volNeeded = int.parse(stdin.readLineSync()!);
    stdout.write('Requirements: ');
    String req = stdin.readLineSync()!;

    Opportunity opportunity = Opportunity(
      title: title,
      description: desc,
      category: category,
      imageUrl: imageUrl,
      location: location,
      duration: duration,
      volunteersNeeded: volNeeded,
      requirements: req,
    );

    opportunities.add(opportunity);
    print('✅ Opportunity "$title" added.');
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

void handleUpdateOpportunity() {
  try {
    stdout.write('Enter title of the opportunity to update: ');
    //String oldTitle = stdin.readLineSync()!;
    String oldTitle = stdin.readLineSync()!.trim();

    Opportunity op = opportunities.firstWhere((o) => o.title == oldTitle);

    stdout.write('New Title: ');
    op.title = stdin.readLineSync()!;
    stdout.write('New Description: ');
    op.description = stdin.readLineSync()!;
    print('✅ Opportunity updated.');
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
    ;
  }
}

void handleDeleteOpportunity() {
  try {
    stdout.write('Enter title to delete: ');
    String title = stdin.readLineSync()!;
    opportunities.removeWhere((o) => o.title == title);
    print('🗑️ Opportunity "$title" deleted.');
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

void handleSearchByCategory() {
  try {
    stdout.write('Enter category: ');
    String catInput = stdin.readLineSync()!.toLowerCase();
    OpportunityCategory category = OpportunityCategory.values.firstWhere(
            (e) => e.toString().split('.').last == catInput);

    var filtered = opportunities.where((o) => o.category == category).toList();
    if (filtered.isEmpty) {
      print('No opportunities found in this category.');
    } else {
      for (var op in filtered) {
        op.displayOpportunity();
      }
    }
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}

void handleUserSignUp() {
  try {
    stdout.write('Enter your username: ');
    String username = stdin.readLineSync()!;
    User user = users.firstWhere((u) => u.username == username, orElse: () {
      stdout.write('User not found. Create new user? (yes/no): ');
      String? create = stdin.readLineSync();
      if (create!.toLowerCase() == 'yes') {
        stdout.write('Enter full name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Password: ');
        String pass = stdin.readLineSync()!;
        User newUser = User(name: name, username: username, password: pass);
        users.add(newUser);
        return newUser;
      } else {
        throw Exception('User not found.');
      }
    });

    stdout.write('Enter opportunity title to sign up: ');
    String title = stdin.readLineSync()!;
    Opportunity op = opportunities.firstWhere((o) => o.title == title);
    user.addParticipation(op);
  } catch (e) {
    print('⚠ Error: ${e.toString()}');
  }
}


void handleDisplayUserParticipation() {
  stdout.write('Enter username: ');
  String username = stdin.readLineSync()!;
  User? user = users.any((u) => u.username == username)
      ? users.firstWhere((u) => u.username == username)
      : null;

  if (user != null) {
    user.displayParticipatedOpportunities();
  } else {
    print('❌ User not found.');
  }
}

