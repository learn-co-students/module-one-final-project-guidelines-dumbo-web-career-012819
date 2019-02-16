require_relative '../config/environment'

def artworks(current_user)
  project_title
  prompt = TTY::Prompt.new
  choice = prompt.select('This is Global Catalogue from all Users') do |menu|
    menu.choice  'Show all artworks', -> {all_artworks(current_user)}
    menu.choice  'Add a new artwork', -> {create_artwork(current_user)}
    menu.choice '<- go back', -> {main_menu(current_user)}
  end
end
##########################################################################
# Method that displays all the available artworks for the user to add to their list.
def all_artworks(current_user)
  project_title
  prompt = TTY::Prompt.new
  puts "\033[1mCatalogue for all Artworks\033[0m"
  puts "\n"
  puts "press enter to select, and filter with letter keys".light_black
  puts "  #{"#".ljust(2)} - #{"Title".ljust(25)} #{"Genre".ljust(10)} #{"Price".ljust(9)}  #{"Gallery".ljust(20)} #{"Gallery Location"}".blue
  prompt.select('', per_page: 10, filter: true) do |menu|
   menu.choice '<- Go back', -> {artworks(current_user)}
    Artwork.sorted_artworks(true).each.with_index(1) do |artwork, index|
      if current_user.user_artworks(true).include?(artwork)
        menu.choice name: "#{index.to_s.ljust(2)} - #{artwork.title.truncate(20).ljust(25)} #{artwork.genre.ljust(10)} $#{artwork.price.to_s.ljust(9)} #{artwork.gallery.name.truncate(18).ljust(20)} #{artwork.gallery.location.truncate(18)}".light_black,
        disabled: '(Added)'.red
      else
        menu.choice "#{index.to_s.ljust(2)} - #{artwork.title.truncate(20).ljust(25)} #{artwork.genre.ljust(10)} $#{artwork.price.to_s.ljust(9)} #{artwork.gallery.name.truncate(18).ljust(20)} #{artwork.gallery.location.truncate(18)}",
         -> {add_artwork_to_user(artwork, current_user)}
      end
    end
  end
end
##########################################################################
def add_artwork_to_user(artwork, current_user)
  project_title
  prompt = TTY::Prompt.new
  prompt.select("Are you sure you want to add #{artwork.title.light_blue} #{artwork.genre.light_blue} to your list?") do |menu|
      menu.choice "Yes, please", -> {artwork.artwork_to_list(current_user)}
      menu.choice "No, sorry", -> {all_artworks(current_user)}
    end
    all_artworks(current_user)
end

def create_gallery
  prompt = TTY::Prompt.new
  puts "Create a Gallery"
  gallery_hash = {}
  gallery_hash[:name] = prompt.ask("Gallery Name:")
  while gallery_hash[:name] == nil || gallery_hash[:name] == 0
    gallery_hash[:name] = prompt.ask("Gallery Name:")
  end
  while gallery_hash[:location] == nil || gallery_hash[:location] == 0
    gallery_hash[:location] = prompt.ask("Location:")
  end
  Gallery.create(gallery_hash).id
end

def create_artwork(current_user)
  project_title
  prompt = TTY::Prompt.new
  puts "Adding artwork"
    genres = ["Painting", "Sculpture", "Ceramic"]
    puts "\n"
    puts "Now create artwork"
    artwork_hash = {}
    title = prompt.ask("Title:")
    while title == nil
      title = prompt.ask("Must add a Title:")
    end
    price = prompt.ask("Price:").to_i
    if price != nil
       price = price.to_s.truncate(9, omission: '').to_i
    end
    while price == nil || price == 0
      price = prompt.ask("Must add a Price:").to_i
      if price != nil
         price = price.to_s.truncate(9, omission: '').to_i
      end
    end
    genre = prompt.select("Choose it's genre:") do |menu|
      genres.each { |genre| menu.choice name: genre, value: genre}
    end
    gallery_id = prompt.select("Choose a gallery:""(scroll down to create new one)".light_black) do |menu|
        Gallery.all.each { |gallery| menu.choice name: "#{gallery.name} #{gallery.location}", value: gallery.id }
          menu.choice "+ Add new gallery if needed", ->{create_gallery}
        end


    artwork_hash[:title] = title
    artwork_hash[:price] = price
    artwork_hash[:genre] = genre
    artwork_hash[:gallery_id] = gallery_id

   if Artwork.create(artwork_hash).id > 0
     puts "Artwork added!"
     prompt.keypress("Press space or enter to continue", keys: [:space, :return])
     artworks(current_user)
   else
     puts "Create error, please try again"
     prompt.keypress("Press space or enter to continue", keys: [:space, :return])
     artworks(current_user)
   end

end
