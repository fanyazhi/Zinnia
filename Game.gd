extends Control


onready var command_processor = $CommandProcessor
onready var player = $Player
onready var phone_screen = $BackGround/MarginContainer/HBoxContainer/VBoxContainer/PhoneScreen
onready var choice_area = $BackGround/MarginContainer/HBoxContainer/VBoxContainer/ChoiceArea
onready var player_room = $BackGround/MarginContainer/HBoxContainer/PlayerRoom
onready var transition_manager = $TransitionManager
onready var animation_player = $TransitionManager/AnimationPlayer
onready var is_typing_prompt = $BackGround/MarginContainer/HBoxContainer/VBoxContainer/IsTypingPrompt/HBoxContainer/IrinaIsTyping
onready var save_menu = $SaveMenu


func _ready() -> void:
	hide_typing()
	
	# TRANSITION - Game start loading
	hide_game()
	hide_save_menu()
	transition_manager.fade_in_silent()
	yield(animation_player, "animation_finished")
	show_save_menu()
	yield(save_menu, "player_loaded")
	yield(get_tree().create_timer(1), "timeout")
	hide_save_menu()
	show_game()
	
	
	# begin game from saved day
	if GameData.current_day == 1:
		exec_day_1()
	elif GameData.current_day == 2:
		exec_day_2()
	elif GameData.current_day == 3:
		exec_day_3()
	
	
	
##################################
#                                #
#             Day 1              #
#                                #
##################################
func exec_day_1():
	# TRANSITION - first day start
	GameData.current_day = 1
	phone_screen.clear_phone_screen()
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	# Add a player choice
	add_multi_choice(["Are you there?", "Hey"])
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	phone_screen.create_time_stamp("Thu. 10:25pm")
	choice_area.clear_all()
	
	yield(get_tree().create_timer(2), "timeout")
	
	# Add a player choice
	add_multi_choice(["Are you there? Irina?", "Irina?"])
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Ok...?")
	
	#Add a player choice
	var text = "i'm just glad we met again, i havent seen you since prom."
	var short_text = "i'm just glad we met again"
	add_single_choice_entry(text, short_text)
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Um... ok... i'm glad we met too, just wasn't sure how to talk to you.")
	
	# Add a player choice
	add_single_choice_entry("Irina... i only want to be nice...", 
							"i only want to be nice")
	add_single_choice_entry("Irina... i really miss you...", 
							"i really miss you")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(0.5), "timeout")
	hide_typing()
	add_her_text_entry("...")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("since we didn't really know each other in high school, ms. student council president! ")

	# Add a player choice
	add_single_choice_entry("I genuinely want to get in touch with you, even back in high school. ", 
							"I wanted to get in touch with you")
	add_single_choice_entry("I didn't get the chance to get to know you, but I really wanted to.", 
							"I didn't get to know you, but i wanted to")
	add_my_text_entry("Oh Come on, stop teasing me! \n" + yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Now that's new information. Didn't know our elite girl was like this. You've CHANGED.")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("*teasing face*")
	
	# Add a player choice
	add_single_choice_entry("Yeah, maybe i've changed... My life really turned upside down since high school...", 
							"Yeah, maybe i've changed...")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))	
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(3), "timeout")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("Huh? What do you mean?")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("Are you in college?")

	# Add a player choice
	add_single_choice_entry("No.")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))	
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry(":O")
	
	# Add a player choice
	add_single_choice_entry("My parents won't let me. They basically locked me down in their bakery. ", 
							"My parents won't let me")
	add_single_choice_entry("I have to work for my parents' bakery. My parents basically locked me there.", 
							"I have to work")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Locking you up you say...?")
	
	# Add a player choice

	add_single_choice_entry(PoolStringArray(["Yeah...i have no one to talk to. ",
											"that's why i really wanted to talk to someone... even if we weren't the closest friends. ", 
											"Yesterday was my only day off in months"
											]).join("\n"), 
							"Yeah...i have no one to talk to")							
	add_single_choice_entry(PoolStringArray(["Yeah...it's awful. ",
											"i can't do anything or talk to anyone. ", 
											"Yesterday was my only day off in months. ",
											"I know we weren't the closest friends, and i know you might not want to talk to me. "
											]).join("\n"), 
							"Yeah...it's awful")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(5), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Don't say that, we can talk more if you want to.")
	
	# Add her entry
	yield(get_tree().create_timer(4), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Hey? Are you still there?")

	# Add a player choice
	var choice_feelbad = "Sorry, didn't mean to make you feel bad."
	var choice_cried = "Sorry, i just cried."
	add_single_choice_entry(choice_feelbad)
	add_single_choice_entry(choice_cried)
	var result = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(result)	
	choice_area.clear_all()

	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	if result == choice_feelbad:
		add_her_text_entry("Hey...it's okay. i really don't mind.")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("you can talk to me, what's going on?")
	else:
		add_her_text_entry("Aww... it's okay, we can talk... so what's going on?")
	
	# Add a player choice
	var choice_threat_short = "my mom threatened to kill herself"
	var choice_useless_short = "my mom says i'm useless"
	var choice_threat = PoolStringArray([
						"I... my parents locked me in their bakery. ",
						"I can't really go out or anything...",
						"or else my mom threatens to kill herself."
						]).join("\n")
	var choice_useless = PoolStringArray([
						"I... my parents locked me in their bakery. " + 
						"I can't really go out or anything..." +
						"And my mom said i'm useless, and it's all my fault that they have to work so hard."
						]).join("\n")
	add_single_choice_entry(choice_threat, choice_threat_short)
	add_single_choice_entry(choice_useless, choice_useless_short)
	result = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(result)	
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(5), "timeout")
	hide_typing()
	add_her_text_entry("Parents shouldn't say that!")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("... I'm just asking, have you talked to them? Maybe talking about your feelings would change their mind?")

	# Add a player choice
	var choice_mom_short = "I can't, mom threatened to kill herself"
	var choice_beat_short = "I can't, they would just beat me up"
	var choice_courage_short = "It's hard to stand up against them"
	var choice_mom = PoolStringArray([
						"i would have, if it weren't for what my mom did...",
						"she literally cutted her wrist and threatens me to commit suicide.",
						"If i leave the bakery now,",
						"she will probably kill me and then herself, no kidding."
						]).join("\n")
	var choice_beat = PoolStringArray([
						"i would have, but my parents would juest beat me up...",
						"they are not normal parents, i can't reason with them.",
						"You won't believe what they say to me sometimes, they are monstrous.",
						]).join("\n")
	var choice_courage = PoolStringArray([
						"I...it's hard to.",
						"they are my parents, i know they love me.",
						"i don't want to be a rebel and break their heart like that.",
						]).join("\n")
	add_single_choice_entry(choice_mom, choice_mom_short)
	add_single_choice_entry(choice_beat, choice_beat_short)
	add_single_choice_entry(choice_courage, choice_courage_short)
	result = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(result)	
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(3), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("I'm angry.")
 
	# Add a player choice
	add_single_choice_entry("Hey, it's alright...\n" + "Irina, enough about me...\n" + "Can you tell me your stories? I want to know what being outside is like, going to college, and stuff :) ", 
							"Irina, enough about me")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))	
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(3), "timeout")
	show_typing()
	yield(get_tree().create_timer(5), "timeout")
	hide_typing()
	add_her_text_entry("Man...")
	phone_screen.create_time_stamp("Thu. 11:30pm")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("after hearing about your story\n" + "now i can't even feel bad about my situation anymore...")
	show_typing()
	yield(get_tree().create_timer(5), "timeout")
	hide_typing()
	add_her_text_entry("*sad cat*")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("I'm just getting really bad grades, my professor hates me and i've got no friends...\n" + "The usual college things.")

	# Add a player choice
	add_single_choice_entry("Oh no... but you are amazing! Your musical talent is over the roof, i remember you winning lots of stuff back in highschool. you were working so hard!", 
							"Oh no... but you are amazing")
	add_single_choice_entry("But, but you still sing, right? Your musical talent is over the roof, i remember you winning lots of stuff back in highschool. you were working so hard!", 
							"But, but you still sing, right?")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(3), "timeout")
	show_typing()
	yield(get_tree().create_timer(4), "timeout")
	hide_typing()
	add_her_text_entry("Thank you aliyah… but you know, I've changed too.")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Um, and about singing.")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("I didn't go to musical school...\n" + "i'm nothing like the person i was bragging about back in the days...")


	# Add a player choice
	add_single_choice_entry("So...you rejected the offer?\n" + "I thought you were really excited when you got accepted! What happened?", 
							"So...you rejected the offer?")
	add_single_choice_entry("Don't give up on singing. You are too good to give up.", 
							"Don't give up on singing")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()


	# Add her entry
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Well...things happened...")
	phone_screen.create_time_stamp("Thu. 12:15am")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("I just can't sing anymore...")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("...but i'm in an art school now!")

	# Add a player choice
	add_single_choice_entry(":0\n" + "I wish i could see you as an artist person, it's got to be cute! ><", 
							":0")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(3), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry(":)\n" + "I'll show you one day, if you want to see it.")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("It's getting pretty late today. gn!")

	# Add a player choice
	var choice_shy = "Don't be shy---"
	add_single_choice_entry(choice_shy)
	add_single_choice_entry("Ok, alright, i'll sleep now, good night Irina.", 
							"good night Irina")
	var response = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(response)
	choice_area.clear_all()
	
	if response == choice_shy:
		yield(get_tree().create_timer(2), "timeout")
		add_single_choice_entry(";) alright, i'll sleep now")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()
		yield(get_tree().create_timer(5), "timeout")
		add_my_text_entry("good night Irina")
		

	# TRANSITION - day end
	yield(get_tree().create_timer(3), "timeout")
	GameData.current_day = 2	
	transition_manager.fade_in()
	yield(animation_player, "animation_finished")
	hide_game()
	show_save_menu_save_only()
	yield(save_menu, "player_loaded")
	yield(get_tree().create_timer(1), "timeout")
	hide_save_menu()
	show_game()
	exec_day_2()
	
	
	
##################################
#                                #
#             Day 2              #
#                                #
##################################
func exec_day_2():
	# TRANSITION - day start
	phone_screen.clear_phone_screen()
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	# Add her entry
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Good morning!")
	phone_screen.create_time_stamp("Fri. 9:58am")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Guess what i woke up to?")
	
	# Add a player choice
	var choice_about_me = "... thoughts about me? :)"
	add_single_choice_entry(choice_about_me)
	add_single_choice_entry("what? tell me!")
	var response = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(response)
	choice_area.clear_all()
	
	if response == choice_about_me:
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("Nah, stop it! *blushing cat*")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("It's actually a small bird!")
		
	# Show image of small bird
	yield(get_tree().create_timer(2), "timeout")
	add_her_text_entry("[picture of a bondaged bird]")
	
	# Add her entry
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("I found him on the apartment porch table")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("looks like he's got bitten by a cat, but he managed to escape...")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("So i took care of him!")

	# Add a player choice
	add_single_choice_entry("Aww, you are such a sweet girl.\n" + "So what are you going to do with him?", "What are you gonna do with him?")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("I don't know... I've never kept a pet before. Should i send it to somebody else?")

	# Add a player choice
	add_single_choice_entry("Why? Do you not like him?")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Of course I do! He's so tiny, so cute! Just look at him!")
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Hmm...what do you think i should do?")

	##################################
	# IMPORTANT PLAYER CHOICE - BIRD #
	##################################
	var choice_keep = "If i were you, i would keep him. "
	var choice_free = "Do you think it's better to let him be free?"
	var choice_kill = "kill it"
	var choice_keep_short = "keep it, of course"
	var choice_free_short = "free it"
	add_single_choice_entry(choice_keep, choice_keep_short)
	add_single_choice_entry(choice_free, choice_free_short)
	add_single_choice_entry(choice_kill)

	response = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(response)
	choice_area.clear_all()

	if response == choice_free:
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(3), "timeout")
		hide_typing()
		add_her_text_entry("Yeah, that's exactly what i'm thinking about! I want him to be free. ")
		yield(get_tree().create_timer(1), "timeout")
		add_single_choice_entry("Yeah...but if i were you, i would keep him", 
								"But I would keep him")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()

	if response == choice_kill:
		yield(get_tree().create_timer(0.5), "timeout")
		show_typing()
		yield(get_tree().create_timer(0.5), "timeout")
		hide_typing()
		add_her_text_entry("WHAT????")
		show_typing()
		yield(get_tree().create_timer(0.5), "timeout")
		hide_typing()
		add_her_text_entry("why would i do that?")
		show_typing()
		yield(get_tree().create_timer(0.5), "timeout")
		hide_typing()
		add_her_text_entry("you serious????")
		
		add_single_choice_entry("I'm kidding, of course!")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()
		
		yield(get_tree().create_timer(2), "timeout")
		show_typing()
		yield(get_tree().create_timer(3), "timeout")
		hide_typing()
		add_her_text_entry("Ok...but don't say that again! that's so horrible!?")
		
		add_single_choice_entry("*sob* My bad. I'm really sorry! Please don't be mad at me, please, please, please... ",
								"I'm sorry, don't be mad at me")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()
		
		yield(get_tree().create_timer(2), "timeout")
		show_typing()
		yield(get_tree().create_timer(3), "timeout")
		hide_typing()
		add_her_text_entry("It's alright, i know you dont mean it. ")
		
		add_single_choice_entry("Thanks for forgiving my terrible attempt at a bad joke. ",
								"Thanks for forgiving me")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()
		
		yield(get_tree().create_timer(2), "timeout")
		add_single_choice_entry("But seriously, if i were you, i would keep him",
								"If i were you, i would keep him")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()

	##################################
	##################################
	
	# Common # 
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Ummm, i don't know, birds belong to the nature...")

	add_single_choice_entry("Well, it's the nature that send him close-to-death. \n" + "If weren't for you, he going to be pretty dead by now. ",
							"If weren't for you, he's dead")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("You are not wrong...")

	add_single_choice_entry("Just keep him. I know I would :)",
							"Just keep him")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Thank you Aliyah, I think I've made up my mind.")
	
	add_single_choice_entry("Keeping him?")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Yes! I'm looking up 'how to keep a pet bird' on youTube...")
	
	add_single_choice_entry("Hooray!")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# IN DAY TRANSITION #
	yield(get_tree().create_timer(2), "timeout")
	transition_manager.fade_in_silent()
	yield(animation_player, "animation_finished")
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	# Add a player choice
	add_single_choice_entry("Finally, an afternoon break...\n" + "*tired cat*", "Finally, an afternoon break...")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	phone_screen.create_time_stamp("Fri. 2:01pm")
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Yo, what a coincidence! i’m zoning out on an art history class.")
	
	# Add a player choice
	add_single_choice_entry("Why not chit chat? ")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(0.5), "timeout")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("Sure!")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("* cat …*\n" + "You remember the art exhibition, where we met?")

	# Add a player choice
	add_single_choice_entry("Yeah, i’ve heard it’s for a pretty famous artist. ", 
							"Yeah, it's for a famous artist")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(0.5), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("So you know! her works are just, majestic.")
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(4), "timeout")
	hide_typing()
	add_her_text_entry("The shapes flows so well, and how she portrays human emotion, is just next level...\n" + 
						"I was almost electrified in the gallery walk. It’s so pretty, it makes me want to die a little...")
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(6), "timeout")
	hide_typing()
	add_her_text_entry("You know, there’s something i do in my off time...\n" + 
						"I would search on the internet, looking for artists who went to the same school as me, and daydream about becoming one of them one day...")

	# Add a player choice
	var choice_exceed = "I’m sure you can exceed them! *serious cat* "
	var choice_natural = "My girl...I get it...Some people are just miracles of existence..."
	var choice_exceed_short = "I’m sure you can exceed them!"
	var choice_natural_short = "Some people are just naturally good"
	add_single_choice_entry(choice_exceed, choice_exceed_short)
	add_single_choice_entry(choice_natural, choice_natural_short)
	response = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(response)
	choice_area.clear_all()
	
	if response == choice_exceed:
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("Thanks for the confidence boost Aliyah!")
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("But seriously. I don’t know if i can do what they’ve done...\n" +
							"They are so talented, and their old school works are miles beyond me...")
		
	if response == choice_natural:
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("Right? *sigh cat*")

	### common
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("I loved the artist so much. You can’t even imagine...\n" +
						"I just wanted to be like her.\n" +
						"Not be like... what i'm doing right now...")
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("I can't even focus on my class...and my last assignment just got an F by the nicest prof in the department..." +
						"I just feel like shit")
	
	# Add a player choice
	add_single_choice_entry("...Irina, are you free tonight? ")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("Uh? I don't have any classes after this, is there something wrong?")

	# Add a player choice
	add_single_choice_entry("No. I'm coming to you, with a lot of sweets.\n" + "Get prepared.",
							"No. I'm coming to you")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(4), "timeout")
	hide_typing()
	add_her_text_entry("*shocked cat*")
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("I, i just was talking about serious stuff... \n" + "But, free sweets!!!")

	# Add a player choice
	add_single_choice_entry("It ain't much, but it's all i've got. \n" + "*tip hat cat*\n" + "Get prepared!",
							"It ain't much, but it's all i've got")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# IN DAY TRANSITION #
	yield(get_tree().create_timer(3), "timeout")
	transition_manager.fade_in_silent()
	yield(animation_player, "animation_finished")
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("That was soo much fun!!!!")
	phone_screen.create_time_stamp("Fri. 11:32pm")
	
	# Add a player choice
	add_single_choice_entry("I know right?\n" + "Some sweets, some video games. That’s what you need. You are awesome, don’t let those thought demons get to you!!!\n" + "*demon cat*", 
							"I know right?")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	# Add her entry
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Thought demons!!!\n" + "Didn’t know that was a thing, did you make it up?")

	# Add a player choice
	add_single_choice_entry("Well, yeah...\n" + "But that’s beside the point!\n" + "Just call me when you need it. I’ll be there for you.", 
							"Well, yeah...")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	# Add her entry
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(3), "timeout")
	hide_typing()
	add_her_text_entry("...Aliyah!")

	# Add a player choice
	var choice_sad = "I just don't want to see you sad"
	var choice_stay = "Don’t let me see you depressed.\n" + "Or... i’ll stay over next time!\n" + "By brute force!"
	var choice_stay_short = "I'll stay over next time"
	add_single_choice_entry(choice_sad)
	add_single_choice_entry(choice_stay, choice_stay_short)
	response = yield(choice_area, "game_on_choice_selected")
	add_my_text_entry(response)
	choice_area.clear_all()

	if response == choice_sad:
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("thanks, i really appreciate that...")
		yield(get_tree().create_timer(0.5), "timeout")
		show_typing()
		yield(get_tree().create_timer(1), "timeout")
		hide_typing()
		add_her_text_entry("And we should totally hang out more!\n" + "next time i want to do something for you too")
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(2), "timeout")
		hide_typing()
		add_her_text_entry("Tomorrow's Saturday! come to my place and we can hang out again, like today")
		
	if response == choice_stay:
		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(3), "timeout")
		hide_typing()
		add_her_text_entry("That's unexpected. You wanted to stay over?")
		
		add_single_choice_entry("Eh?")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()

		yield(get_tree().create_timer(1), "timeout")
		show_typing()
		yield(get_tree().create_timer(1), "timeout")
		hide_typing()
		add_her_text_entry("You should have told me!! My bed's pretty big, you can totally use my stuff.")

		add_single_choice_entry("Eh?")
		add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
		choice_area.clear_all()

		yield(get_tree().create_timer(0.5), "timeout")
		show_typing()
		yield(get_tree().create_timer(0.5), "timeout")
		hide_typing()
		add_her_text_entry("Let's do it tomorrow!!\n" + "I won’t let you go.")

	add_single_choice_entry("Ye, yess...")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()


	# TRANSITION - day end
	yield(get_tree().create_timer(3), "timeout")
	transition_manager.fade_in()
	yield(animation_player, "animation_finished")
	exec_day_3()

##################################
#                                #
#             Day 3              #
#                                #
##################################
func exec_day_3():
	# TRANSITION - day start
	GameData.current_day = 3
	phone_screen.clear_phone_screen()
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Aliyah!!!it’s saturday morning!!!")
	phone_screen.create_time_stamp("Sat. 10:35am")

	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("Are you awake?")
	
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(4), "timeout")
	hide_typing()
	add_her_text_entry("Hey, don’t tell me you are still in bed. I promised i’ll hunt you down and keep you at my place tonight!\n" + "Don’t you ever forget!")

	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(4), "timeout")
	hide_typing()
	add_her_text_entry("Ok, if you are asleep, i'll be patient.")
	
	yield(get_tree().create_timer(3), "timeout")


	# IN DAY TRANSITION #
	yield(get_tree().create_timer(2), "timeout")
	transition_manager.fade_in_silent()
	yield(animation_player, "animation_finished")
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	
	yield(get_tree().create_timer(0.5), "timeout")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("Aliyah...?")
	phone_screen.create_time_stamp("Sat. 1:15pm")
	
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("It's afternoon already.\n" + "Don't tell me you are still asleep, you lazy girl!")

	add_single_choice_entry("Sorry, my mom was here. She scolded me for being home late yesterday, and took my phone away.",
							"Sorry, my mom was here.")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	
	yield(get_tree().create_timer(2), "timeout")
	show_typing()
	yield(get_tree().create_timer(2), "timeout")
	hide_typing()
	add_her_text_entry("What...?\n" + "Fuck her. You are fucking 20, you are an adult and you can make your decisions.")

	add_single_choice_entry("But...")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()

	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("*sigh cat*\n" + "No need to say.. I get it.")
	
	yield(get_tree().create_timer(1), "timeout")
	show_typing()
	yield(get_tree().create_timer(1), "timeout")
	hide_typing()
	add_her_text_entry("It seems like our plan is ruined...\n" + "But it's okay. We still got plenty of time.")
	
	
	# TRANSITION - day end
	yield(get_tree().create_timer(4), "timeout")
	transition_manager.fade_in()
	yield(animation_player, "animation_finished")
	exec_day_4()
	

##################################
#                                #
#             Day 4              #
#                                #
##################################
func exec_day_4():
	# TRANSITION - day start
	GameData.current_day = 4
	phone_screen.clear_phone_screen()
	transition_manager.fade_out_silent()
	yield(animation_player, "animation_finished")
	
	# Add a player choice
	add_single_choice_entry("It ain't much, but it's all i've got. \n" + "*tip hat cat*\n" + "Get prepared!",
							"It ain't much, but it's all i've got")
	add_my_text_entry(yield(choice_area, "game_on_choice_selected"))
	choice_area.clear_all()
	pass
	
	
##### Helpers #####
func add_multi_choice(choices: Array):
	for choice in choices:
		add_single_choice_entry(choice)
	
func add_single_choice_entry(text: String, short_text := ""):
	choice_area.create_entry(text, short_text)
	
func add_her_text_entry(text: String):
	phone_screen.create_left_entry(text)

func add_my_text_entry(text: String):
	phone_screen.create_right_entry(text)
	
func show_typing():
	is_typing_prompt.visible = true
	
func hide_typing():
	is_typing_prompt.visible = false
	
func hide_save_menu():
	save_menu.hide_save_menu()

func show_save_menu():
	save_menu.show_save_menu()
	
func show_save_menu_load_only():
	save_menu.show_save_menu_load_only()

func show_save_menu_save_only():
	save_menu.show_save_menu_save_only()
	
func hide_game():
	$BackGround.hide()
	$InteractiveObjects.hide()

func show_game():
	$BackGround.show()
	$InteractiveObjects.show()


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	match anim_name:
		"fade_in":
			pass
		"fade_out":
			pass
