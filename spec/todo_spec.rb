require 'rspec'
require 'task'
require 'list'
require 'ClassTask'

describe "Task" do
  it 'initialies a Task list' do
    test_task = Task.new("Take out the garbage")
    test_task.should be_an_instance_of Task
  end

  it 'Displays the inputted task back to the user' do
    test_task = Task.new("Take out the garbage")
    test_task.description.should eq "Take out the garbage"
  end
end
describe "List" do
  it 'creates a new instance of the List class' do
    test_list = List.new("Groceries")
    test_list.should be_an_instance_of List
  end
  it 'reads out the description of the list' do
    test_list = List.new("Groceries")
    test_list.description.should eq "Groceries"
  end
end

describe Task do
  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
    end
  end
end
