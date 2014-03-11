require './lib/todo'
require './lib/list'

@tasks = []
@completed_list = []
@lists = []




def main_menu

  puts "Press 'a' to add a task or 'l' to list all of your tasks"
  puts "Press 'c' to see your list of completed tasks"
  puts "To start a new list on which to put your tasks, press 'n'"
  puts "Press x to exit"

  main_choice = gets.chomp
    if main_choice == "a"
      new_task
    elsif main_choice == "l"
      list_tasks
    elsif main_choice == "c"
      list_complete
    elsif main_choice == "n"
      list_new
    elsif main_choice == "x"
      "Goodbye"
    else
      "Invalid input. Please enter another."
      main_menu
    end
end

def list_new
  puts "Please enter the name of your new List"
  list_input = gets.chomp
  new_list = List.new(list_input)
  @lists << new_list # this is incorrect! Lists are in progress


end


def list_complete
  if @completed_list.length < 1
    puts "None of your tasks have been completed! Get back to work!\n\n"
  else
    puts "Here is a list of your completed tasks:\n"
    @completed_list.each_with_index do |task, index|
      puts "# " + (index + 1).to_s + " " + task.description + "\n"
  end
  end
  main_menu
end


def new_task
  puts "Enter description of you new task here:\n"
  add_task = gets.chomp"\n\n"
@tasks << Task.new(add_task)
  "\n"
  puts "Task added to list.\n\n"
  main_menu
end

def list_tasks

    puts "Here is a list of your current tasks:\n"
  @tasks.each_with_index do |task, index|
      puts "# " + (index + 1).to_s + " " + task.description + "\n"
    end
      puts "\n"
      puts "To delete one of these tasks, press 'd'"
      puts "To mark one of these tasks as complete, press 'c'"
      puts "to go back to the main menu enter any other key"
      user_input = gets.chomp
      if user_input == 'd'
        puts "Plese enter the number of the task you wish to delete"
        delete_input = gets.chomp.to_i
        delete_input = delete_input - 1
      @tasks.delete_at(delete_input)
        puts "Task # " + (delete_input + 1).to_s + " has been deleted"
        main_menu
      elsif user_input == 'c'
        puts "Please enter the number of the task you wish to mark complete"
        complete_task = gets.chomp.to_i
        complete_task = complete_task - 1
        @completed_list << @list[complete_task]
        list_complete
      else
      main_menu
      end

end

main_menu
