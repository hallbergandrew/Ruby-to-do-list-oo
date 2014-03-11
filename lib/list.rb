
class List

  def initialize(description)
  @description = description
  @tasks = []
  end

  def description
  @description
  end


  def add_task(task_to_add)
    @tasks << task_to_add
  end

  def tasks
    @tasks.each_with_index do |task, index|
      puts "Task: " + index.to_s + " " + task.description.to_s
    end
  end

  def task_arr
    @tasks
  end
end

