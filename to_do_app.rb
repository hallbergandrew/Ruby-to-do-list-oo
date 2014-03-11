require './lib/task'
require './lib/list'
require './lib/ClassTask'

@lists = []


def first_menu
   puts "Press 'i' to create a new list or press 'j' to add to an existing list."
   puts "Press 'x' to exit"
  first_choice = gets.chomp

  if first_choice == 'i'
    new_list
  elsif first_choice == 'j'
    display_lists
  elsif first_choice == 'x'
    Puts "Goodbye"
  else
    puts "invalid input"
  first_menu
  end
end

def new_list
  puts "Enter description of you new list here:"

  new_list = gets.chomp
  new_list = List.new(new_list)
  @new_list = new_list
  @lists << @new_list
  puts "New list" + @new_list.to_s +  "created."
  main_menu
end

def display_lists
  if @lists.length >0
    @lists.each_with_index do |list, index|
      puts "# " + (index).to_s + " " + list.description.to_s
    end
  "\n"
  puts "Please enter the number for the list you would like to edit"
  list_to_edit = gets.chomp.to_i
  @new_list = @lists[list_to_edit]
  puts  @new_list.description.to_s.capitalize + " is ready to edit"
  main_menu
  else
  puts "There are no current lists, please make a new one first"
  first_menu
  end

end

def main_menu


  puts "Press 'a' to add a task or 'l' to list and/or change the tasks in the list"
  puts "Press 'b' to go back to the start menu or to create a new list"
  puts "Press x to exit"

  main_choice = gets.chomp
    if main_choice == "a"
      new_task
    elsif main_choice == "l"
      list_tasks
    elsif main_choice == "b"
      first_menu
    elsif main_choice == "x"
      "Goodbye"
    else
      "Invalid input. Please enter another."
      main_menu
    end
end

def new_task
  puts "Enter description of you new task here:\n"
  task_to_add = gets.chomp"\n\n"
  @new_list.add_task(Task.new(task_to_add))
  puts "Task added to list.\n\n"
  puts "To add another task to the list press 'a' else press any key"
  another_task = gets.chomp
  if another_task == 'a'
    new_task
  else
  main_menu
  end
end

def list_tasks
  if @new_list.task_arr.length > 0
    puts "Here is a list of your current tasks:\n"
    @new_list.tasks

    "\n\n"
      puts "\n"
      puts "To remove one of these tasks, press 'r'"
      puts "To give priority to an item on the list, press 'p'"
      puts "To set a due date for an item, press 'd'"
      puts "to go back hit 'b' any other key"
      user_input = gets.chomp
      if user_input == 'p'
      puts "Please choose the number of the item you would like to add priority to"
      puts @new_list.tasks
      puts @new_list.tasks
      puts @new_list.tasks
      "\n\n"
      task_index = gets.chomp.to_i
      puts "Please enter a priority between 1 and 5, with 5 being the highest"
      user_priority = gets.chomp.to_i
      @new_list.task_arr[task_index].set_priority(user_priority)
      puts "Priority for " + @new_list.task_arr[task_index].description + " has been set to " + @new_list.task_arr[task_index].priority.to_s
      main_menu
      elsif user_input == 'd'
        puts "Please choose the number of the item you would like to add priority to"
        puts @new_list.tasks
        task_index = gets.chomp.to_i
        puts "Please enter how many days away you would like to set the due date"
        user_date = gets.chomp.to_i
        @new_list.task_arr[task_index].set_due_date(user_date)
        puts "Due date set for " + @new_list.task_arr[task_index].description.to_s + " and has been set for " + @new_list.task_arr[task_index].due_date.to_s.slice!(0..9) + ", " + user_date.to_s + " days from now."

        main_menu

      elsif user_input == 'r'
        puts "Please enter the number of the task you wish to delete"
        delete_input = gets.chomp.to_i
        delete_input = delete_input
        @new_list.task_arr.delete_at(delete_input)
        puts "Task # " + (delete_input).to_s + " has been deleted"
        main_menu
      else
        main_menu
      end
  else
    puts "There are not current tasks in this list, please add some"
    main_menu
  end
end

first_menu
