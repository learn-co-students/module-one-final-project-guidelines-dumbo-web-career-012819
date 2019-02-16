require_relative '../config/environment'

def show_all(current_user)
  project_title
  puts "  \033[1mMy Collection\033[0m"
  puts "\n"
  if current_user.artwork_count < 1
    prompt = TTY::Prompt.new
    prompt.select('Your list is currently empty',per_page: 2) do |menu|
      menu.choice '> Add more to the list', -> {artworks(current_user)}
      menu.choice '<- Go back', -> {main_menu(current_user)}
    end
  else
    prompt = TTY::Prompt.new
    puts "  (find items by letter keys)".light_black
    puts "  #{"#".ljust(2)} - #{"Title".ljust(25)} #{"Genre".ljust(10)} #{"Price".ljust(9)}  #{"Gallery".ljust(20)} #{"Gallery Location"}".blue
    choice = prompt.select('',per_page: 10, filter: true) do |menu|
      current_user.user_artworks.each.with_index(1) do |user_artwork, index|
        if user_artwork.sold == false
          menu.choice "#{index.to_s.ljust(2)} - #{user_artwork.artwork.title.truncate(20).ljust(25)} #{user_artwork.artwork.genre.ljust(10)} $#{user_artwork.artwork.price.to_s.ljust(9)} #{user_artwork.artwork.gallery.name.truncate(18).ljust(20)} #{user_artwork.artwork.gallery.location.truncate(18)}",
          -> {my_list_option(current_user, user_artwork)}
        else
          menu.choice "#{index.to_s.ljust(2)} - #{user_artwork.artwork.title.truncate(20).ljust(25)} #{user_artwork.artwork.genre.ljust(10)} $#{user_artwork.artwork.price.to_s.ljust(9)} #{user_artwork.artwork.gallery.name.truncate(18).ljust(20)} #{user_artwork.artwork.gallery.location.truncate(18)}".light_black + "(Sold)".red,
          -> {my_list_option(current_user, user_artwork)}
        end
      end
      menu.choice '> add more from Global Catalogue', -> {artworks(current_user)}
      menu.choice '<- go back', -> {main_menu(current_user)}
    end
  end
end

def my_list_option(current_user, user_artwork)
  artwork = user_artwork.artwork
  project_title
  puts "Artwork info"
  puts "Title:"
  puts "#{artwork.title.light_blue}"
  puts "Price:"
  puts "#{"$".light_blue}#{artwork.price.to_s.light_blue}"
  puts "Genre:"
  puts "#{artwork.genre.light_blue}"
  puts "Gallery:"
  puts "#{artwork.gallery.name.light_blue}"
  puts "Gallery Location:"
  puts "#{artwork.gallery.location.light_blue}"
  prompt = TTY::Prompt.new
  choice = prompt.select('What would you like to do?') do |menu|
    puts "\n"
    if user_artwork.sold == false
      menu.choice "Mark as sold", -> {user_artwork.artwork.mark_as_sold(current_user)}
    else
        menu.choice "Mark as available", -> {user_artwork.artwork.mark_as_sold(current_user)}
    end
    menu.choice "Delete", -> {delete_artwork_from_list(user_artwork.artwork, current_user)}
    menu.choice '<- Go back', -> {show_all(current_user)} # good
  end
  show_all(current_user)
end

def delete_artwork_from_list(artwork, current_user)
  artwork.delete_artwork(current_user)
end

def add_item(current_user)
  artworks(current_user)
end
