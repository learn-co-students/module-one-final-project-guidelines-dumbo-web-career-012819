require_relative '../config/environment'

def project_title
  system "clear"
  system "figlet -w 118 -c Find ArtWorks | lolcat -a -d 1"
end

def exit_programm
  project_title
  abort("Thanks for your visit, we'll see you soon! \n ")
end

def find_artworks
  current_user = nil
  project_title
  prompt = TTY::Prompt.new
  answer = prompt.select("Welcome to Find Artworks. Ready to start?") do |menu|
    menu.choice name: "Yes ✓" ,value: true
    menu.choice name: "No, not yet ✘", value: false
  end
  if answer == false
    exit_programm
  elsif answer == true
    intro(login_screen)
  end
end

def main_menu(current_user)
  project_title
  puts "Hello, #{current_user.username}!".titleize
  prompt = TTY::Prompt.new
  choice = prompt.select("") do |menu|
    menu.choice name: "Go to My List", value: 1
    menu.choice name: "Global Catalogue", value: 3
    menu.choice "Switch User", -> {login}
    menu.choice "Logout", -> {find_artworks}
    menu.choice "> exit", -> {exit_programm}
  end
  go_to_option(choice, current_user)
end

def go_to_option(option, current_user)
  case option
  when 1
    show_all(current_user)
  when 3
    artworks(current_user)
  end
end
