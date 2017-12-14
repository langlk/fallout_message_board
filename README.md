# Fallout Message Board
### _Epicodus Practice in Ruby on Rails, December 13, 2017_

### By Kelsey Langlois

## Description

_This is a site made to work with the message board API located at [langlk/message_board](https://github.com/langlk/message_board). It allows users to sign up for an account, view groups and messages, and post, update, and delete their own messages._

## Installation and Setup

To install on your own machine, follow the instructions below:

* First you will need to set up the message board API to run on a separate localhost port:
  * First, clone the repository from [https://github.com/langlk/message_board](https://github.com/langlk/message_board) and run the following commands in the message_board root directory:
    ```
    bundle update
    rake db:setup
    rails db:seed
    rails s -p 3001
    ```
* Next, you'll need to obtain an API key to give the client site access.
  * To do so, you will need to create an account with the following API call:
    ```
    POST http://localhost:3001/api/v1/users?name=[your_user_name]&email=[your_email]&password=[your_password]
    ```
  If the account is created successfully, your API key will be included in the response. Save the key for now.
* Clone this repository.
* Create a ```.env``` file and add the following to it:
  ```
  API_KEY = '[your_api_key]'
  ```
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails db:seed
  yarn add jquery
  rails s
  ```
* Open ```localhost:3000``` in your web browser

## Specifications

* Site displays all groups and messages stored in the API database.
* Site user account is linked to an API user account, allowing user to log in and post/edit/delete their own messages.
* Site posts new messages to the API database.
* Site patches message updates to the API database.
* Site deletes messages from the API database.

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Rack::Throttle

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
