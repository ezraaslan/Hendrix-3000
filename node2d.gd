extends Node2D

var chord_handled = false
var tempo_handled = false

func _on_line_edit_text_submitted(chord):
	if chord in Global.notes:
		print(chord)
		Global.chord = str(chord)
		$LineEdit.hide()
		solo()
		chord_handled = true
		if tempo_handled == true and chord_handled == true:
			Global.go = true

func _on_line_edit_2_text_submitted(tempo):
	if tempo.is_valid_float() == true:
		print(tempo)
		Global.tempo = 60/float(tempo)
		$LineEdit2.hide()
		print(Global.tempo)
		tempo_handled = true
		if tempo_handled == true and chord_handled == true:
			Global.go = true
func solo():
	var index = Global.notes.find(Global.chord)
	var removing = []
	for i in index:
		removing.append(Global.notes[i])
		
	for j in len(removing):
		Global.notes.push_back(Global.notes[j])
	for l in removing:
		Global.notes.erase(l)
	print(Global.notes)
	
func _on_timer_timeout():
	Global.go = true

func _process(delta):
	if Input.is_action_just_pressed("A"):
		Global.chord = "A"
		solo()
	elif Input.is_action_just_pressed("B"):
		Global.chord = "B"
		solo()
	elif Input.is_action_just_pressed("C"):
		Global.chord = "C"
		solo()
	elif Input.is_action_just_pressed("D"):
		Global.chord = "D"
		solo()
	elif Input.is_action_just_pressed("E"):
		Global.chord = "E"
		solo()
	elif Input.is_action_just_pressed("F"):
		Global.chord = "F"
		solo()
	elif Input.is_action_just_pressed("G"):
		Global.chord = "G"
		solo()
	elif Input.is_action_just_pressed("c"):
		Global.chord = "C#"
		solo()
	elif Input.is_action_just_pressed("d"):
		Global.chord = "D#"
		solo()
	elif Input.is_action_just_pressed("f"):
		Global.chord = "F#"
		solo()
	elif Input.is_action_just_pressed("g"):
		Global.chord = "G#"
		solo()
	elif Input.is_action_just_pressed("a"):
		Global.chord = "A#"
		solo()
