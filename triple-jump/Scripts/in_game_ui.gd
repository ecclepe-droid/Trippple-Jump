extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ProgressBar.min_value = 0
	$ProgressBar.max_value = 10000
	$ProgressBar.value = 10000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ProgressBar.value = Globals.jetpack_fuel
