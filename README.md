# journal

The program should enable a user to view existing journal entries in a list, view a single journal entry, and add a new journal entry. In addition, the program should enable a user to change the application theme from light to dark. The theme preferences and journal data should persist between application restarts. Lastly, the application should be adaptive, based on the amount of horizontal space available on the screen. The functional requirements are:

Display a "welcome" widget when the application starts and there are no journal entries.
Provide the user, via a button in the right of the AppBar, with a toggle-able configuration option, presented in a Drawer, to change the theme from light to dark.
Changing the configuration should immediately change the visual theme of the app.
The configuration preference should persist between application restarts, and be honored when the user starts the application.
When no prior saved preference exists, use the light theme.
When the application starts, load the saved theme configuration, and immediately use it when creating the MaterialApp.
Model a journal consisting of journal entries. A JournalEntry object has an id (an integer), title (a string), body (a string), rating (an integer), and date (a DateTime).
Display a list of existing journal entries, by displaying the title and date of the journal entry.
Display the details of the journal entry, including its title, body, date and numeric rating, when tapped on in the list.
Enable the user to go "back" to the list when viewing the details of a journal entry full-screen.
Adapt the interface to display the list of journal entries on the left, and the details of the entry on the right (in a "master-detail" layout convention) when the device has at least 800* pixels of horizontal space. (* If your simulator/device screen isn't large enough, just pick a width that makes sense, eg 500 or 700.)
Display a FloatingActionButton that, when tapped, displays a form for entering attributes of a new journal entry.
Validate the values in the form, ensuring that the title and body are not blank, and that the rating is an integer between 1 and 4.
Create a new journal entry when the form's "Save" button is tapped, and return to the previous screen
Ensure that new journal entries appear in the list after the form's "Save" button is tapped.
Ensure that previously-created journal entries appear in the list when the application first starts.
In addition to the functional requirements above, your application should meet the following technical requirements:

Do not use a state management library, such as provider or scoped_model. Rely on manual state management and/or APIs in the Flutter SDK.
Use the "shared preferences" concept of mobile applications to load and save the theme configuration option, so that the chosen option persists between application restarts.
Use a sqlite database file to store, retrieve and update the journal entries, so that the data persists between application restarts. Do not "pre-create" the database file - have your app code do it on the device. Name the database file journal.sqlite3.db.Use the following queries or create your own:
SELECT * FROM journal_entries;
INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);
Do not hard-code the database schema as a String in your code. Use the "assets" or "file i/o" concept of mobile applications to load the text of the initial SQL statement that creates the schema of the sqlite database. Use this text filePreview the document.
The functional and technical requirements specifically exercise the Exploration content and our module learning outcomes.

This application is a challenge, but do not freak out. Start early, apply what you know, try adding features guided by the Exploration content, and iteratively add more features, one at a time.

Consider the following steps, and consult the Tips below.

Step 1
Relax. Start early. You've got this. The rubric is not punitive. We want to see you attempt these challenges and do your best to synthesize course concepts together in a working application. We must put ourselves in challenging positions that catalyze our learning. Building a non-trivial app is the vehicle for our learning. Struggle is ok.

Step 2
Create a new Flutter application named journal. Clean up the boilerplate, create your root App class, and then review the list of functional requirements.

Step 3
Define your model classes, given the functional and technical requirements.

Step 4
Choose one feature to tackle, such as the theming configuration, or laying out a form, or displaying a ListView of mock journal entries. Or, consider creating screens with placeholders, and getting your routes and navigation in place.

Step 5
Iteratively add new features to your application. See the Tips below. Pay attention to quality, especially about how your project is organized, whether you have incorporated a simple model, avoided significant nesting, defined and used many of your own custom composed widgets, and so on. The Explorations provide valuable insight on each functional and technical requirement.

The Explorations do not walk you though building a specific feature, but they do give you the specific tools you need to synthesize together into this complete application.

You'll know this is complete when you have a program that behaves like the example interaction animation displayed above, meets the description of the functional and technical requirements, persists its state between application restarts, and your code exhibits a competency of using both Dart language features and Flutter best practices. Be sure to review the rubric.
