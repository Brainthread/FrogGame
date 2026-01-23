extends DeathManager

signal died

func die():
	print(get_parent().get_parent().name, " died. ")
