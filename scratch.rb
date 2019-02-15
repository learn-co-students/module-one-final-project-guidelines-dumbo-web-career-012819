require_relative "config/environment.rb"

pastel = Pastel.new


prompt = TTY::Prompt.new
font = TTY::Font.new(:starwars)
puts font.write("Access Labs")


right_answer_box = TTY::Box.frame(
 width: 150,
 height: 10,
 align: :center,
 padding: 3,
 border: :thick,
 style: {
 fg: :black,
 bg: :green}

) do "WOOOHOOO" end;

wrong_answer_box = TTY::Box.frame(
 width: 150,
 height: 10,
 align: :center,
 padding: 3,
 border: :thick,
 style: {
 fg: :black,
 bg: :red}
) do "WRONG" end;



answer = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
if answer == 'Scorpion'
   puts right_answer_box
   pid = fork{ exec 'afplay', "media/Homer-Woohoo!(1).wav" }
   # “afplay ../sound/Homer-Woohoo!(1).wav”

else
   puts wrong_answer_box
   # afplay “../sound/Homer-D’oh!(1).wav”
   pid = fork{ exec 'afplay', "media/Homer-D'oh!(1).wav" }
end



flag =
<<~HEREDOC
  __
 <__>
  ||________________________________________________________
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||########################################################|
  ||~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ||
  ||
  ||
  ||


HEREDOC







"Byeeee"
