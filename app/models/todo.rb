class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_comlpeted = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_comlpeted}"
  end
end
