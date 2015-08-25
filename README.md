# Mikan

This is a presentation, but I'm a bit lazy tonight. Will write it later or will ask Blacksheep to do it.

Maintained by  [Fnux](https://github.com/Fnux) & [Blackseep](https://github.com/L33tSheep).

## @ToDo
* Comment everything.
* Front-end
* Improve translations, especially on the admin side.
* Improve translation files. Actually it's a mess.
* Explain how to help us translating mikan
* Allow the user to export data (CSV,XML,JSON, ?)
* A system to suggest changes and add items. We won't pass through the contact form forever.
* Deploy to production...
* Stuff.

## How to help us ?

Coming soon.

You'll get a free hug if I see you one day.

## Setup (development)
First, you need ruby & ruby on rails. If you're on windows, you can download [this (Ruby Installer)](http://rubyinstaller.org/) and [this (Rails Installer, require ruby)](http://railsinstaller.org/en) or switch to linux (much better <3).
If you're running on Linux, you should be able to find ruby in your repositories (`sudo dnf install ruby` or `sudo apt-get install ruby`). You can also use rbenv, rvm or compile the sources following [this tutorial (Ubuntu/OS X)](https://gorails.com/setup/ubuntu/15.04)
Then, you can download & launch the application :
* `bundle install` # Install dependencies (gems)
* `rake db:migrate` # generate the database
* `rake db:seed` # populate the database
* `rails server` # launch the web server

Mikan should be available on http://127.0.0.1:3000. Have fun <3
