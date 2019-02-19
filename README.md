# FIND ART
	Welcome to our command line app for brokers between galleries and clients.



## Instructions

1. Fork and clone this repository.

2. In your terminal, make sure homebrew is up to dat by typing “brew install” then type in “bundle install” for below gems:
    ```
    gem "sinatra-activerecord"
    gem "sqlite3"
    gem "pry"
    gem "require_all"
    gem "faker"
    gem "tty-prompt"
    gem "lolcat"
    gem "colorize"
    gem "tty-file"
    gem "figlet"
    
    ```
   ![](ProjectCloning.gif)

3. In the 'environment.rb' file comment 'ActiveRecord::Base.logger.level = 1', in the terminal, type “rake db:migrate”
   to create tables, then “rake db:seed” to create some dummy data to play around then uncomment
   'ActiveRecord::Base.logger.level = 1'.

   ![](BasicSetup.gif)

4. Now you are ready for the app! on the main directory type "ruby bin/run.rb".

	 ![](project-display.gif)
