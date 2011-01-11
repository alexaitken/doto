require 'spec_helper'

describe TodosController do
  
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
  
  it "should produce a new todo in the new action" do
    get :new
    assigns[:todo].should be_an_instance_of(Todo)
    assigns[:todo].id.should be_nil 
  end
  
  context "successful saving" do
    before do
      @todo = Todo.new
      Todo.stub!(:new).with("description" => "get milk").and_return(@todo)
    end
    it "should save the todo item" do
    
      @todo.should_receive(:save).once.and_return(true)
    
      post :create, :todo => { :description => "get milk" }
    
    
    end
    
    
    it "should give success message on save" do
      @todo.stub!(:save).and_return(true)
      post :create, :todo => { :description => "get milk" }
      
      flash[:notice].should eq("Todo Item Added")
    end
  end
  
  context "failing save" do
    before do
      @todo = Todo.new
      Todo.stub!(:new).with("description" => "get milk").and_return(@todo)
    end
    it "should save the todo item" do
    
      @todo.stub!(:save).once.and_return(false)
    
      post :create, :todo => { :description => "get milk" }
    
      response.should render_template(:new)
    end
  end
end
