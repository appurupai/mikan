# Mikan

Mikan is a multi-language anime charts website. You'll be able to see what will release in the next season and browse past season. Our focus is to propose a clean and easy to read interface, a community approach to create the mikan's database and a way to export our community-created database in multiple way to do whatever you want to with it.

Maintained by  [Fnux](https://github.com/Fnux) (Code) & [Blackseep](https://github.com/L33tSheep) (Graphic).

## @ToDo
* Front-end [80%]
* Create contributors' accounts.
* A system to suggest changes and add items. We won't pass through the contact form forever.
* Deploy to production...
* Stuff.

## How to help us ?

In order to add a new language to MIKAN, there is few things to do (xx is the locale you want to add):
* You have to create the config/locales/xx.yml file. Use config/locales/en.yml as template.
* You have to give us a flag (.png) : app/assets/images/locales/xx.png
* You have to add the following line in the language selector's helper (in app/helpers/application_helper.rb) :

`(link_to image_tag("locales/xx.png",  class: "language-flag #{"current-language" if locale == "xx" }"),  params.merge(:locale => "xx"))`

If there is anything, please contact us. We'll be glad to help you.

You'll 2 free hug if we see you one day.

## Setup (development)
First, you need ruby & ruby on rails. If you're on windows, you can download [this (Ruby Installer)](http://rubyinstaller.org/) and [this (Rails Installer, require ruby)](http://railsinstaller.org/en) or switch to linux (much better :heart:).
If you're running on Linux, you should be able to find ruby in your repositories (`sudo dnf install ruby` or `sudo apt-get install ruby`). You can also use rbenv, rvm or compile the sources following [this tutorial (Ubuntu/OS X)](https://gorails.com/setup/ubuntu/15.04)
Then, you can download & launch the application :
* `bundle install` # Install dependencies (gems)
* `rake db:migrate` # generate the database
* `rake db:seed` # populate the database
* `rails server` # launch the web server

Mikan should be available on http://127.0.0.1:3000. Have fun ! :heart:
