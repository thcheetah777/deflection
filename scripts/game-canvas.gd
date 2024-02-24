class_name GameCanvas extends CanvasLayer

@export var player_health_dynamics: DynamicsResource

@onready var player_health: TextureProgressBar = $PlayerHealth
@onready var dash_bar: TextureProgressBar = $DashBar

var player_health_dynamics_solver: DynamicsSolverVector

func _ready() -> void:
	player_health.tint_under = ColorPalette.colors.dark
	player_health.tint_over = ColorPalette.colors.light
	player_health.tint_progress = ColorPalette.colors.accent

	dash_bar.tint_under = ColorPalette.colors.dark
	dash_bar.tint_over = ColorPalette.colors.dark
	dash_bar.tint_progress = ColorPalette.colors.accent

	var half_viewport = get_viewport().get_visible_rect().size / 2
	offset = Globals.camera.base_offset - half_viewport

	player_health_dynamics_solver = Dynamics.create_dynamics_vector(player_health_dynamics)

	Events.health_change.connect(_on_health_change)

func _process(_delta: float) -> void:
	player_health.value = Globals.player.health
	player_health.scale = player_health_dynamics_solver.update(Vector2.ONE)

func _on_health_change(_new_health: float):
	player_health_dynamics_solver.set_current(Vector2.ONE * 1.2)
