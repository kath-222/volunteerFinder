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

// 1. User Class: for user data and volunteer participation
class User {
  String _name;
  String _username;
  String _password;
  String? _location;
  String? _profilePicture;
  List<Opportunity> _participatedOpportunities = [];  // Track opportunities user has joined

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

  // getters and setters
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

  // add participated opportunity
  void addParticipation(Opportunity opportunity) {
    _participatedOpportunities.add(opportunity);
    print('$name has signed up for opportunity "${opportunity.title}".');
  }

  // display User Info
  void displayUserInfo() {
    print('Name: $_name');
    print('Username: $_username');
    if (_location != null) print('Location: $_location');
    if (_profilePicture != null) print('Profile Picture: $_profilePicture');
  }

  // display Participated Opportunities
  void displayParticipatedOpportunities() {
    print('$name has participated in the following opportunities:');
    for (var op in _participatedOpportunities) {
      op.displayOpportunity();
    }
  }
}

// 2. Opportunity Class: for opportunity details
class Opportunity {
  String _title;
  String _description;
  OpportunityCategory _category;
  String _imageUrl;
  OpportunityStatus _status;
  String _location;
  int _duration; // Duration in hours/days
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

  // getters and setters
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

  // display opportunity details
  void displayOpportunity() {
    print('Title: $_title');
    print('Category: ${_category.toString().split('.').last}');
    print('Description: $_description');
    print('Location: $_location');
    print('Duration: $_duration hours/days');
    print('Volunteers Needed: $_volunteersNeeded');
    print('Requirements: $_requirements');
    print('Status: ${_status.toString().split('.').last}');
  }
}

// 3. Organization Class: for organization details, goals, and news
class Organization {
  String _orgName;
  String _description;
  String _location;
  String _goals; // Goals for the organization
  String _contactInfo;
  List<Opportunity> _postedOpportunities = [];
  List<String> _newsUpdates = []; // News and updates about the organization

  Organization({
    required String orgName,
    required String description,
    required String location,
    required String contactInfo,
    required String goals,  // Goals for the organization
  })  : _orgName = orgName,
        _description = description,
        _location = location,
        _contactInfo = contactInfo,
        _goals = goals;

  // getters and setters
  String get orgName => _orgName;
  String get description => _description;
  String get location => _location;
  String get contactInfo => _contactInfo;
  String get goals => _goals; // Getter for goals
  List<Opportunity> get postedOpportunities => _postedOpportunities;
  List<String> get newsUpdates => _newsUpdates;

  set orgName(String value) => _orgName = value;
  set description(String value) => _description = value;
  set location(String value) => _location = value;
  set contactInfo(String value) => _contactInfo = value;
  set goals(String value) => _goals = value; // Setter for goals

  // add Opportunity to Organization
  void addOpportunity(Opportunity opportunity) {
    _postedOpportunities.add(opportunity);
    print('Opportunity "${opportunity.title}" added by $_orgName');
  }

  // add News Update
  void addNewsUpdate(String news) {
    _newsUpdates.add(news);
    print('News update added: $news');
  }

  // display Organization Information
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

List<Opportunity> opportunities = [];
List<User> users = [];
List<Organization> organizations = [];

void showMenu() {
  print('\n--- Welcome to the Local Volunteer Finder ---');
  print('1. Add Opportunity');
  print('2. View All Opportunities');
  print('3. View Organization Information');
  print('4. Update Opportunity');
  print('5. Delete Opportunity');
  print('6. Search Opportunities by Category');
  print('7. Exit');
  print('Please choose one of the menu numbers (1-7):');
}

void main() {
  bool running = true;

  while (running) {
    showMenu();
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1: // add Opportunity
        print('Enter title for the new opportunity:');
        String title = stdin.readLineSync()!;
        print('Enter description for the opportunity:');
        String description = stdin.readLineSync()!;
        print('Enter category for the opportunity (1: Education, 2: MedicalHelp, 3: Environment, 4: Relief, 5: Others):');
        int categoryChoice = int.parse(stdin.readLineSync()!);
        OpportunityCategory category = OpportunityCategory.values[categoryChoice - 1];
        print('Enter image URL for the opportunity:');
        String imageUrl = stdin.readLineSync()!;
        print('Enter location for the opportunity:');
        String location = stdin.readLineSync()!;
        print('Enter duration (in hours):');
        int duration = int.parse(stdin.readLineSync()!);
        print('Enter number of volunteers needed:');
        int volunteersNeeded = int.parse(stdin.readLineSync()!);
        print('Enter requirements for the opportunity:');
        String requirements = stdin.readLineSync()!;
        Opportunity opportunity = Opportunity(
          title: title,
          description: description,
          category: category,
          imageUrl: imageUrl,
          location: location,
          duration: duration,
          volunteersNeeded: volunteersNeeded,
          requirements: requirements,
        );
        opportunities.add(opportunity);
        print('Opportunity "$title" added!');
        break;

      case 2: // view all opportunities
        if (opportunities.isEmpty) {
          print("No opportunities available.");
        } else {
          for (var op in opportunities) {
            op.displayOpportunity();
          }
        }
        break;

      case 3: // view Organization information
        print('Enter Organization name to view information:');
        String orgName = stdin.readLineSync()!;
        Organization org = organizations.firstWhere((org) => org.orgName == orgName, orElse: () => Organization(orgName: '', description: '', location: '', contactInfo: '', goals: ''));
        org.displayOrganizationInfo();
        break;

      case 4: // update Opportunity
        print('Enter title of the opportunity to update:');
        String oldTitle = stdin.readLineSync()!;
        Opportunity opportunity = opportunities.firstWhere((op) => op.title == oldTitle);
        print('Enter new title:');
        opportunity.title = stdin.readLineSync()!;
        print('Enter new description:');
        opportunity.description = stdin.readLineSync()!;
        break;

      case 5: // delete Opportunity
        print('Enter title of the opportunity to delete:');
        String title = stdin.readLineSync()!;
        opportunities.removeWhere((op) => op.title == title);
        print('Opportunity "$title" deleted');
        break;

      case 6: // search Opportunities by category
        print('Enter category to search for opportunities (1: Education, 2: MedicalHelp, 3: Environment, 4: Relief, 5: Others):');
        int categoryChoice = int.parse(stdin.readLineSync()!);
        OpportunityCategory category = OpportunityCategory.values[categoryChoice - 1];
        for (var op in opportunities.where((op) => op.category == category)) {
          op.displayOpportunity();
        }
        break;

      case 7: // exit
        print('Exiting...');
        running = false; // stop the loop and exit the program
        break;

      default:
        print('Invalid choice, please try again.');
    }
  }
}
