class TodosController < ApplicationController
  def index
    @todos = Todo.find(:all)
  end
  
  def new 
    @todo = Todo.new
    
  end
  
  def create
    @todo = Todo.new(params[:todo])
    
    if @todo.save
      
      flash[:notice] = "Todo Item Added"
      redirect_to todos_path
    else
      render :new
    end
  end
end
