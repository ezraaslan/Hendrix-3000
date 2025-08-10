extends AudioStreamPlayer2D

var playback # Will hold the AudioStreamGeneratorPlayback.
@onready var sample_hz = get_node("/root/Node2D/AudioStreamPlayer2D").stream.mix_rate
var buffer = true
var scale1 = []

func _ready():
	get_node("/root/Node2D/AudioStreamPlayer2D").play()
	playback = get_node("/root/Node2D/AudioStreamPlayer2D").get_stream_playback()
	scale1 = [Global.notes[0], Global.notes[2], Global.notes[4], Global.notes[7], Global.notes[9]]


func fill_buffer():
	var phase = 0.0
	var increment = Global.pulse_hz / sample_hz
	var frames_available = playback.get_frames_available()

	for i in range(frames_available):
		playback.push_frame(Vector2.ONE * sin(phase * TAU))
		phase = fmod(phase + increment, 1.0)
		
func _process(delta):
	if Input.is_action_just_pressed("major"):
		scale1 = [Global.notes[0], Global.notes[2], Global.notes[4], Global.notes[7], Global.notes[9]]
	if Input.is_action_just_pressed('minor'):
		scale1 = [Global.notes[0], Global.notes[3], Global.notes[5], Global.notes[7], Global.notes[10]]
	if Global.go == true:
		fill_buffer()
		#scale1 = [Global.notes[0], Global.notes[2], Global.notes[4], Global.notes[7], Global.notes[9]]
		print(scale1)
		randomize()
		var random = randi() % 4 + 1
		var note = scale1[random]
		var a = [1, 1, 1]
		var b = randi() % 3
		var adjustment = a[b]
		Global.tempo = Global.tempo * adjustment
		get_node("/root/Node2D/Timer").wait_time = Global.tempo
		Global.tempo = Global.tempo/adjustment
		
		
		
		
		if note == "C":
			Global.pulse_hz = Global.frequencies[0]
		elif note == "C#":
			Global.pulse_hz = Global.frequencies[1]
		elif note == "D":
			Global.pulse_hz = Global.frequencies[2]
		elif note == "D#":
			Global.pulse_hz = Global.frequencies[3]
		elif note == "E":
			Global.pulse_hz = Global.frequencies[4]
		elif note == "F":
			Global.pulse_hz = Global.frequencies[5]
		elif note == "F#":
			Global.pulse_hz = Global.frequencies[6]
		elif note == "G":
			Global.pulse_hz = Global.frequencies[7]
		elif note == "G#":
			Global.pulse_hz = Global.frequencies[8]
		elif note == "A":
			Global.pulse_hz = Global.frequencies[9]
		elif note == "A#":
			Global.pulse_hz = Global.frequencies[10]
		elif note == "B":
			Global.pulse_hz = Global.frequencies[11]
		
			
		print(note)
		get_node('/root/Node2D/Timer').start()
		Global.go = false
