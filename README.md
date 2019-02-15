# Project Title

An interactive trivia game based on information scraped from the CIA Factbook. The game consists of 14 questions that auto generate their own data.

## Getting Started

Clone this project into your local machine and follow the instructions bellow.

### Installing

After cloning the project folder onto your local machine, take the following steps

Install the gems required for the game by running the following command from the project folder

```
bundle install
```

create the necessary tables by running migrations

```
rake db:migrate
```

seed the database with the information needed to play the game(this may take a couple of minutes)

```
rake db:seed
```
after seeding, make sure to comment out the "factbook" gem in the Gemfile to deactivate loggers

```
# gem "factbook"
```

to start the game, run the following command from you project folder

```
Ruby bin/run.rb
```


## Built With

* [factbook]
* [nokogiri]
* [tty-prompt]
* [tty-box]
* [tty-font]
* [pastel]
* [sinatra-activerecord]

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

See the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
