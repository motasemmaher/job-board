
## Job Board


## Technology Stack

- [RVM][rvm]
- [Ruby 3.1.2][ruby]
- [Ruby on Rails 7.0.3][rails]
  =

## Installation Guide

### 1. Install [RVM][rvm]
    $ curl -sSL https://get.rvm.io | bash -s stable --ruby

### 2. Install [Ruby  3.1.2][ruby]
    $ rvm install  3.1.2

### 3. Create new gemset and use it
    $ rvm use  3.1.2@job-board --create

### 4. Clone the repository
	$ git clone git@github.com:motasemmaher/job-board.git
	$ cd job-board

### 5. Install bundler
    $ rvm use 3.1.2@job-board --ruby-version
    $ gem install bundler:2.3.10

If you are using macOS, a recommended approach is to install ImageMagick using Homebrew.   
This can be done with the following command:

    $ brew install imagemagick

### 6. Install dependencies
On the project root there is a Gemfile file.  
Make sure you install all the required dependencies before running app.

    $ bundle install

### 7. Setup environment variables
    $ mv .env.sample .env
    # open .env file and enter values for environment variables

### 8. Create and migrate database
    $ rails db:create
    $ rails db:migrate

### 9. Run App
    $ rails server -p 3001 -b 0.0.0.0

## Demo
    $ https://sea-lion-app-2tzxu.ondigitalocean.app
All api's started with api/v1

## Copyright
Copyright (c) 2022 Mo'tasem Maher Salem.

[rvm]: https://rvm.io/
[ruby]: https://www.ruby-lang.org/
[rails]: http://rubyonrails.org/
[brew]: https://brew.sh/
