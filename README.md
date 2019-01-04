![screen shot 2019-01-03 at 6 35 26 pm](https://user-images.githubusercontent.com/39714935/50670098-6bcad500-0f86-11e9-862e-457c5a122a1d.png)
[![Build Status](https://travis-ci.com/BeccaHyland/mentor_match_api.svg?branch=master)](https://travis-ci.com/BeccaHyland/mentor_match_api)
[![Waffle.io - Columns and their card count](https://badge.waffle.io/BeccaHyland/mentor_match_api.svg?columns=all)](https://waffle.io/BeccaHyland/mentor_match_api)

# Mentor Match (API)

## Introduction
  Mentor Match is an app for internal staff and student use at Turing School of Software & Design. In Module 1, Turing students have the opportunity to be matched to a software development mentor, usually an alumni, so this app gives admin tools to manage the matching process.

 In later Modules, students also contact alumni for short-term mentoring as a part of students' Professional Devlelopment curriculum, such as mock interviews and individual coffee meetings. Students can log in to the app to search for mentors in areas of interest and to connect.

In this repo, you will find the code and documentation for the Mentor Match back end, which provides the database and API endpoints for the Mentor Match Project and is deployed at https://mentor-match-api.herokuapp.com/

 Mentor Match is also deployed to a staging environment.
 
 ## Table of Contents
* [Initial Setup](#initial-setup)
* [Mentor Endpoints](#mentor-endpoints)
* [Student Endpoints](#student-endpoints)
* [StudentMentor Endpoints](#student-mentor-endpoints)
* [Build Details](#build-details)
* [Known Issues](#known-issues)
* [Schema Design](#schema-design)

## <a name="initial-setup"></a>Initial Setup
Run locally:
1. Clone the repo found here: (https://github.com/BeccaHyland/mentor_match_api)
2. Run `bundle` from the CLI.
3. Run `rails s`
4. Using `localhost:3000` as the base of your url in browser, add the endpoint of your choice.  See below.

## API Endpoints
This is documentation for the prototype endpoints which will be deprecated shortly. Visit [here](https://github.com/BeccaHyland/mentor_match_api/blob/master/README_endpoints.md) for up-to-date endpoint documentation.

All successful database requests return JSON in an easy-to-consume format generated by the [fast_jsonapi gem](https://github.com/Netflix/fast_jsonapi). To supply the Front End app with data, this project provides the following endpoints:
## <a name="mentor-endpoints"></a>Mentor Endpoints
### 1.  All mentors in the database:
  GET `/api/v1/mentors` *currently unsecured, authorization coming soon*
  * returns JSON in the following format:

  <img width="640" alt="screen shot 2018-12-22 at 2 26 45 pm" src="https://user-images.githubusercontent.com/39714935/50378771-06c2c700-05f7-11e9-945a-3bd7af26f190.png">

### 2. One mentor by its id
GET `/api/v1/mentors/INSERT ID HERE`
* returns JSON in the following format:

<img width="625" alt="screen shot 2018-12-22 at 2 39 08 pm" src="https://user-images.githubusercontent.com/39714935/50378785-61f4b980-05f7-11e9-9652-8dedf130888f.png">

### 3. Create a new mentor in the database
POST `/api/v1/mentors`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`

#### BODY:
* JSON
* A sucessful post returns `status: 201` and returns the new mentor.
* The minimum required fields to create a mentor are: name, city, and email.
`{
"name": "name of mentor",
"email": "email of mentor",
"city": "city of mentor", 
"user_id": "associated user_id"
}`

* the database already stores defaults for the attributes `active` and `matched`, so these are NOT included with a POST.
* full example:

<br>
{
  <br>
        	"name": "Sara Mentor", <br>
            "email": "sara@sara.com", <br>
            "city": "Sarahville", <br>
            "state": "CO", <br>
            "country": "(will default to US if not provided)", <br>
            "slack_username": "sara_slack", <br>
            "pronouns": "she/her", <br>
            "current_title": "Software Developer", <br>
            "current_employer": "Sara's employer", <br>
            "background": "I was a student in the FE program, and I love my cat and learning Vue", <br>
            "industries": ["food service", "sales"], <br>
            "ways_to_mentor": ["1-on-1", "coffee meetings"], <br>
            "expertise_tech": ["JavaScript", "Mocha/Chai", "Node.js", "React", "Redux"], <br>
            "expertise_non_tech": ["rock-climbing", "parenting", "cooking"], <br>
            "mentee_capacity": 1, *(this is an integer)* <br>
            "meeting_location": ["remote"], <br>
            "preferences": ["parent", "female-identifying", "FE"], <br>
            "user_id": 2 *(this is an integer)*<br>
}<br>

### 4. Update a mentor in the database
PATCH/PUT `/api/v1/mentors/(:mentor_id)`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`

#### BODY:
See above POST request, PATCH does not require all attributes, only those being updated.

### 5. Delete a mentor from the database
DELETE `/api/v1/mentors/(:mentor_id)`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`

## <a name="student-endpoints"></a>Student Endpoints
### 1.  All students in the database:
  GET `/api/v1/students`
  * returns JSON in the following format:<br>
  ![screen shot 2019-01-03 at 1 22 05 pm](https://user-images.githubusercontent.com/38568909/50660069-bedb6280-0f5b-11e9-904b-0425dd9b9c50.png)<br>

### 2. One student by its id
  GET `/api/v1/students/INSERT ID HERE`
  * returns JSON in the following format:<br>
  ![screen shot 2019-01-03 at 1 22 35 pm](https://user-images.githubusercontent.com/38568909/50660094-d581b980-0f5b-11e9-9701-0825b6727d3e.png)<br>

### 3. Create a new student in the database
  POST `/api/v1/students`
  * request must include:
#### HEADERS:
  `{
  "Content-Type": "application/json",
  "Accept": "application/json"
  }`

#### BODY:
  * JSON
  * A sucessful post returns `status: 201` and returns the new student.
  * The minimum required fields to create a student are: name and email where the email must be unique.
  `{
  "name": "name of student",
  "pronouns": "pronouns of student",
  "email": "email of student",
  "slack_username": "slack_username of student",
  "background": "background of student",
  "industries": ["industries of student"],
  "stack": "stack of student",
  "identity_marker": ["identity_marker of student"]
  }`

  * the database stores defaults for the attributes `"matched": "false"` , `"active": "true"` , `"industries": []` , `"identity_marker": []`.
  * full example:<br>
  ![screen shot 2019-01-03 at 1 23 47 pm](https://user-images.githubusercontent.com/38568909/50660040-a9fecf00-0f5b-11e9-8642-497d6fb2c1fa.png)<br>

### 4. Update a student in the database
PATCH/PUT `/api/v1/students/(:student_id)`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`

#### BODY:
See above POST request, PATCH does not require all attributes, only those being updated.

### 5. Delete a student from the database
DELETE `/api/v1/students/(:student_id)`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`

## <a name="student-mentor-endpoints"></a>StudentMentor Endpoints
### 1.  All student mentor relationships in the database:
  GET `/api/v1/student_mentors`
  * returns JSON in the following format:<br>
  ![screen shot 2019-01-03 at 1 40 17 pm](https://user-images.githubusercontent.com/38568909/50660486-247c1e80-0f5d-11e9-8e46-84116a542cba.png)<br>

### 2. One student mentor relationship in the database by its id:
  GET `/api/v1/student_mentors/INSERT ID HERE`
  * returns JSON in the following format:<br>
  ![screen shot 2019-01-03 at 1 41 08 pm](https://user-images.githubusercontent.com/38568909/50660517-3eb5fc80-0f5d-11e9-8055-d7b5fddf0404.png)<br>

### 3. Create a new student mentor in the database:
  POST `/api/v1/student_mentors`
  * request must include:
#### HEADERS:
  `{
  "Content-Type": "application/json",
  "Accept": "application/json"
  }`

#### BODY:
  * JSON
  * A sucessful post returns `status: 201` and returns the new student mentor relationship.
  * The minimum required fields to create a student are: student_id and mentor_id where the a student and mentor must exist.
  `{
  "student_id": "student_id as an integer",
  "mentor_id": "mentor_id as an integer",
  "active": "true"
  }`

  * the database stores defaults for the attributes `"active": "true"`.
  * full example:<br>
  ![screen shot 2019-01-03 at 1 43 11 pm](https://user-images.githubusercontent.com/38568909/50660594-92284a80-0f5d-11e9-8d16-4c21b8a97a77.png)<br>

### 4. Update a student mentor in the database
PATCH/PUT `/api/v1/student_mentors/(:student_mentor_id)`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`

#### BODY:
See above POST request, PATCH does not require all attributes, only those being updated.

### 5. Delete a student mentor from the database
DELETE `/api/v1/student_mentors/(:student_mentor_id)`
* request must include:
#### HEADERS:
`{
"Content-Type": "application/json",
"Accept": "application/json"
}`


### <a name="build-details"></a>Build Details: *(draft collection of all details, to be formatted)*

initial build command: `rails new mentor_match_api -T -d postgresql --skip-spring --skip-turbolinks`

Gems added:

general:

gem 'fast_jsonapi'
gem 'rack-cors', require 'rack/cors'
gem 'active-designer'

development & test
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'faker'


  test only
  gem 'simplecov'

 Run `rails g rspec:install`

 To rails_helper, added

 `Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end`
and `require 'faker'`

To spec_helper, added:
`require 'database_cleaner'`
`require 'simplecov'`
`SimpleCov.start "rails"`

within the spec_helper RSpec configure:
`config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end
    config.around(:each) do |example|
        DatabaseCleaner.cleaning do
        example.run
      end
    end`

  in config/application.rb, added:
  `config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end` for the rack-cors gem


## <a name="known-issues"></a>Known Issues
Integration with OAuth and JWT is in development.

## Running Tests
Run `rspec` from the CLI to run all tests.
Run `rspec` then the filepath of the test you wish to run.

## How to Contribute
Drop a line to the creators, or add a Pull Request on GitHub.

## Core Contributors
Rebecca Hyland<br>
Casey Hoepner<br>
Alex Rau<br>
Tim Fielder

## <a name="schema-design"></a>Schema Design

<img width="1438" alt="screen shot 2019-01-02 at 6 30 11 pm" src="https://user-images.githubusercontent.com/39714935/50665860-7fb70c80-0f6f-11e9-8956-0c36cafdaa38.png">

## Tech Stack List
* Ruby 2.4.1
* Ruby on Rails 5.1
* Postgresql
* OAuth
* JSON Web Tokens
