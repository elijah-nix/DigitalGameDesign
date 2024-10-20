extends Button

var CardScene = preload("res://card.tscn")  # Preloading for performance
var card_instance #instance of a card
var game_scene #game scene. woah

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Preload the card scene once when the script is loaded
	print(CardScene)  # This should print: [PackedScene:...]
	print(typeof(CardScene)) #Should be 16
	game_scene = get_node("/root/GameScene")  # Adjust the path to game_scene as needed

func _on_pressed() -> void:
	# Check if this prints when the button is pressed
	print("Button was pressed!")
	if(game_scene.isPlayerTurn && game_scene.currentCardAmt < 5):
		placeCard(card_instance)
		game_scene.isEnemyTurn()

func placeCard(_cardInstance) -> void:
	var cardNum = game_scene.getCurrentCardAmt()
	if(cardNum < 5):
		# Instance the card scene
		_cardInstance = CardScene.instantiate()
		print("Card instantiated!")	
		# Get the game_scene node
		print("game_scene got!")
		game_scene.pickUpCard()
		# Add the card instance to the game_scene node
		game_scene.add_child(_cardInstance)
		_cardInstance.position = Vector2(200 * cardNum + 100, 550)
		_cardInstance.scale *= .4
	else:
		print("Can't add card! Too many cards!")
	
	
