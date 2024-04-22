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
var setword


func _ready(): #Ryder
	for i in names2:
		itemlist.add_item(str(i))
	
	
	
	
func generateName(OneWord): #Written by Owen
	var rng = RandomNumberGenerator.new()
	var name1 = ""
	var name2 = ""
	if WithUppercase.button_pressed == true:
		name1 = names[rng.randi_range(0,names.size()-1)]
		if not OneWord:
			if setword == null:
				name2 = names2[rng.randi_range(0,names2.size()-1)]
			else:
				name2 = setword
	else:
		name1 = names[rng.randi_range(0,names.size()-1)].to_lower()
		if not OneWord:
			if setword == null:
				name2 = names2[rng.randi_range(0,names2.size()-1)].to_lower()
			else:
				name2 = setword.to_lower()
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
	var text
	var numbers
	var symbols
	text = (generateName(OneWord.button_pressed))
	if WithNumbers.button_pressed == true:
		numbers = (generateNumbers(1000,9999))
	else:
		numbers = (generateNumbers(10,99))
	if WithSymbols.button_pressed == true:
		print(GenerateSymbols())
		symbols = str((GenerateSymbols()))
		concatenatedname = (str(symbols)+str(text)+str(numbers)+str(symbols))
	else:
		concatenatedname = (str(text)+str(numbers))
	$Label.text = concatenatedname
	print(concatenatedname)


		
		


func _on_item_list_item_selected(index):
	setword = str(names2[index])
