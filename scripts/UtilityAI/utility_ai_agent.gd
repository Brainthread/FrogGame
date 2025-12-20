class_name  UtilityAiAgent extends Node

signal top_score_changed(top_score)

@export var enabled: bool = true

var _current_top_action:UtilityAiAction
var _action_scores:Array[float] = []
