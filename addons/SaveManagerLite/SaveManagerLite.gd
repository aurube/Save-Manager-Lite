extends Node

var save_path := "user://save_data.json"

func save_game(data: Dictionary) -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data, "\t"))
		file.close()
		print("💾 Game saved to", save_path)
	else:
		push_error("❌ Failed to save game")

func load_game() -> Dictionary:
	if not FileAccess.file_exists(save_path):
		print("⚠️ No save file found")
		return {}
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var result = JSON.parse_string(content)
	if result is Dictionary:
		print("📂 Game loaded")
		return result
	else:
		push_error("❌ Failed to parse save file")
		return {}

func delete_save() -> void:
	if FileAccess.file_exists(save_path):
		DirAccess.remove_absolute(save_path)
		print("🗑️ Save deleted")
