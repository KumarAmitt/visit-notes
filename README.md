# Visit Notes

This is a web application to be used by the speech Therapist to track the progress
of a patient and write feedback notes for them.

### Features
- An admin can set the goals, sub-goals, and associated words in advance.
- A therapist can assign goals to the patients according to the requirement.
- When a goal is assigned to the patient, all the sub-goals and the words associated with that goal get assigned to the patient automatically.
- A therapist can do trials for a word and record the response in form of `+` or `-`.
- A therapist can further choose the prompting_level for each word.
- The system calculates the associated score the displays it after finishing the trial for each word.
- A therapist can leave a feedback note on patient performance after finishing each sub-goal.

## Built With 🛠

```
- Ruby: 3.0.3
- Ruby on Rails: 7.0.0
- Postgresql
- Bootstrap
```


## Getting started

> Follow these steps to get a copy and Running it on your local machine

1. - [ ] Run `git clone https://github.com/KumarAmitt/visit-notes.git` to clone the repository in your local machine.
2. - [ ] Run `cd visit-notes` to enter inside the directory
3. - [ ] Run `bundle install` to install Ruby Gems.
4. - [ ] Run `rails db:create` to create your database
5. - [ ] Run `rails db:migrate` to migrate your database
6. - [ ] Run `rails db:seed` to populate the patient data  
7. - [ ] Run `rails s` to get the server running
8. - [ ] Enter `http://localhost:3000/` in the browser to get the app running

  
- First, go to the Goals and set a few goals, sub-goals, and words (as the admin sets these data in advance).
- Go to the patient to choose a patient. Now you can assign goals to the patient.
- After assigning a goal, you can select a goal to do leave specific notes for each sub-goals, and can do the trials for the associated words.


