require 'spec_helper'

describe TodosController do
  it "should render the index template for index" do
    get :index
    response.should render_template(:index)
  end
  
  it "should give empty todos list when there are no todo in the system" do
    Todo.stub!(:find).and_return(Array.new)
    get :index
    assigns[:todos].should be_empty
  end
  
  it "should give the todos list that are entered into the system" do
    todoItems = [Todo.new (:item)]
    Todo.stub!(:find).and_return(todoItems)
    get :index
    assigns[:todos].should eq(todoItems)
  end
end
