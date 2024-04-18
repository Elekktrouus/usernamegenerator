extends Control
var rng = RandomNumberGenerator.new()
var isNumbers = false
var isSymbols = false
var isUppercase = false
@onready var WithNumbers = $Button/MoreNumbers
@onready var WithSymbols = $Button2/WithSymbols
@onready var WithUppercase = $Button3/WithUppercase
@onready var WithSpaces = $Button4/WithSpaces
@onready var itemlist = $Button5/ItemList
@onready var OneWord = $Button7/OneWord
var names = ["Dog", "Cat", "Horse"]
var names2 = ["Big", "Sad", "Happy"]
var symbols = ["!", "@", "%", "-"]
var randomName = ["Dog", "Cat", "Horse"]
var name1 = ""
var name2 = ""


func _ready(): #Ryder
	for i in names:
		itemlist.add_item(str(i))
	
	
	
func generateName(): #Written by Owen
	var rng = RandomNumberGenerator.new()
	var name1 = ""
	var name2 = ""
	if WithUppercase.button_pressed == true:
		
		name1 = names[rng.randi_range(0,names.size()-1)]
		name2 = names2[rng.randi_range(0,names2.size()-1)]
	else:
		name1 = names[rng.randi_range(0,names.size()-1)].to_lower()
		name2 = names2[rng.randi_range(0,names2.size()-1)].to_lower()
	if WithSpaces.button_pressed:
		return(str(name2, " ", name1))
	else:
		return(str(name2,name1))
	
	

func GenerateSymbols():
	var gensymbols = symbols[rng.randi_range(0,symbols.size()-1)]
	return(gensymbols)

func generateNumbers(lower,upper):
	var number = rng.randi_range(lower,upper)
	return(number)

func _on_button_6_pressed():
	var concatenatedname
	print(generateName())
	if WithNumbers.button_pressed == true:
		print(generateNumbers(1000,9999))
	else:
		print(generateNumbers(10,99))
	if WithSymbols.button_pressed == true:
		print(GenerateSymbols())
		

func _on_button_7_pressed():
	if OneWord.button_pressed == true:
		print(str(name1))
		
		
