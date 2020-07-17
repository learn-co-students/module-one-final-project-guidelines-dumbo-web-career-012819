test_forest = Test.create(name: "The Forest")
test_castle = Test.create(name: "The Castle")
test_oasis = Test.create(name: "The Oasis")
test_love = Test.create(name: "The Love Path")

question_forest_one = Question.create(desc: "Who do you see walking with you?", test: test_forest)
question_forest_two = Question.create(desc: "What kind of animal is it?", test: test_forest)
question_forest_three = Question.create(desc: "What does the animal do?", test: test_forest)
question_forest_four = Question.create(desc: "What do you do?", test: test_forest)
question_forest_five = Question.create(desc: "What kind of house do you see and do you see a fence?", test: test_forest)
question_forest_six = Question.create(desc: "Describe what's on the table.", test: test_forest)
question_forest_seven = Question.create(desc: "What is the cup made out of? What do you do with the cup?", test: test_forest)
question_forest_eight = Question.create(desc: "What kind of body of water is it?", test: test_forest)
question_forest_nine = Question.create(desc: "How wet do you get?", test: test_forest)
  
question_castle_one = Question.create(desc: "You are in front of the door of the castle. How exactly do you imagine it?", test: test_castle)
question_castle_two = Question.create(desc: "You pass the door of the castle and realize that there is no soul. It is desert. What is the first thing you see?", test: test_castle)
question_castle_three = Question.create(desc: "You look around and find a staircase. You decide to climb the stairs. What does the staircase look like?", test: test_castle)
question_castle_four = Question.create(desc: "After you climb the stairs, you reach a small room in which there is only one window. How big is it?", test: test_castle)
question_castle_five = Question.create(desc: "You look out the window. What do you see?", test: test_castle)
question_castle_six = Question.create(desc: "You go down the stairs and you’re back in the area where you were when you first entered the castle. You go ahead and find a door at the rear of the building. You open it and go out in a yard. What exactly does it look like?", test: test_castle)

question_oasis_one = Question.create(desc: "How big is the field?", test: test_oasis)
question_oasis_two = Question.create(desc: "How big is the cube?", test: test_oasis)
question_oasis_three = Question.create(desc: "What is the color of the cube?", test: test_oasis)
question_oasis_four = Question.create(desc: "What is the texture of the cube?", test: test_oasis)
question_oasis_five = Question.create(desc: "Is the ladder short or long? Near or Far from you?", test: test_oasis)
question_oasis_six = Question.create(desc: "Is it near or far from the cube? Is it strong or weak?", test: test_oasis)
question_oasis_seven = Question.create(desc: "What is the horse doing?", test: test_oasis)
question_oasis_eight = Question.create(desc: "What color is the horse?", test: test_oasis)
question_oasis_nine = Question.create(desc: "How many flowers do you see?", test: test_oasis)
question_oasis_ten = Question.create(desc: "Is it raining, foggy, windy or sunny?", test: test_oasis)
question_oasis_eleven = Question.create(desc: "Is it mild or strong? Is it in the background or right above the cube?", test: test_oasis)
  
question_love_one = Question.create(desc: "Which one do you take to get your significant other's house?", test: test_love)
question_love_two = Question.create(desc: "What are the combination of roses?", test: test_love)
question_love_three = Question.create(desc: "Which do you do?", test: test_love)
question_love_four = Question.create(desc: "Where do you leave them?", test: test_love)
question_love_five = Question.create(desc: "When you arrive, are they", test: test_love)
question_love_six = Question.create(desc: "Which road do you take back home?", test: test_love)

