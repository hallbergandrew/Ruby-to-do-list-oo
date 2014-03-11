require 'rspec'
require 'todo'

describe "Task" do
  it 'initialies a Task list' do
    test_list = Task.new("Take out the garbage")
    test_list.should be_an_instance_of Task
  end

  it 'Displays the inputted task back to the user' do
    test_list = Task.new("Take out the garbage")
    test_list.description.should eq "Take out the garbage"
  end
end


