# README

Flatiron school Rails Final Project

Rate That Restaurant

This is a Ruby on Rails application that allows users to create accounts and add reviews about restaurants they have been to. The Models included are:

User - has many reviews and has many restaurants through reviews Review - belongs to a user and belongs to a restaurant through a joins table

The main page before logging in gives the user the option of Sign In, Sign Up or Sign In With Github. All pages have a home button in the nav bar.

After signing in, the home page displays all of a user's reviews and gives the user the option of viewing a list of all restaurants and reviews by other users, as well as the ability to create another restaurant review.

When the user adds (or edits) a review the inputs are validated with appropriate messaging. The user can select from restaurants reviewed by other users or can add a new one. However, a user cannot create more than one review for a restaurant and a user cannot edit or delete another user's review

Installation

Pull requests are welcome on Github at https://github.com/ashleighchun/rate_that_restaurant.

Usage

To run the application: In the terminal: $ bundle install $ rails s In the browser: localhost:3000/


License

This application was developed under the guidance of Flatiron School on learn.co.
