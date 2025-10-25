@tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("SaveManager", "res://addons/SaveManager/SaveManager.gd")
	print("✅ SaveManager registered")

func _exit_tree():
	remove_autoload_singleton("SaveManager")
	print("❌ SaveManager unregistered")
