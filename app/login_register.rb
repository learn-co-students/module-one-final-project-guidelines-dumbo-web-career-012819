require_relative '../config/environment'

current_user = nil

def login_screen
  project_title
  prompt = TTY::Prompt.new
  choice = prompt.select('Login to your account, or resgister to create an account with us.') do |menu|
    menu.choice 'Login', -> {login}
    menu.choice 'Register', -> {register}
    menu.choice '> exit', -> {exit_programm}
  end
  choice
end

def register
  project_title
  puts "\033[1mCreate an Account:\033[0m"
  if !go_back
    user_hash = enter_user_data
    user = User.add_user(user_hash)
    while !user.instance_of? User
      project_title
      puts "\033[1mCreate an Account:\033[0m"
      puts "\nUsername already taken, please try again.".red
      puts "\n"
      if !go_back
        user_hash = enter_user_data
        user = User.add_user(user_hash)
      else
        login_screen
      end
    end
    main_menu(user)
  else
    login_screen
  end
end

def login
  project_title
  puts "\033[1mLogin to Your Account:\033[0m"
  if !go_back
    user_hash = enter_user_data
    user = User.user_login(user_hash)
    while !user.instance_of? User
      project_title
      puts "\033[1mLogin to Your Account:\033[0m"
      puts "\nIncorrect username or password, please try again.".red
      puts "\n"
      if !go_back
        user_hash = enter_user_data
        user = User.user_login(user_hash)
      else
        login_screen
      end
    end
    system "say Hello, #{user.username}!"
    main_menu(user)
  else
    login_screen
  end
end

def go_back
  prompt = TTY::Prompt.new
  answer = prompt.select("If you are at the wrong page, hit go back to the previous page") do |menu|
    menu.choice name: "continue", value: false
    menu.choice name: "go back", value: true
  end
end

def enter_user_data
  prompt = TTY::Prompt.new
  user_hash = {}
  username = prompt.ask("Username: ")
  while username == nil
    username = prompt.ask("This space can't be nil- Username: ")
  end
  password = prompt.mask("Password: ")
  while password == nil
    password = prompt.mask("This space can't be nil- Password: ")
  end
  user_hash[:username] = username.downcase
  user_hash[:password] = password.downcase
  user_hash
end
