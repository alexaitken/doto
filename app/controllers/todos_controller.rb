class TodosController < ApplicationController
  def index
    @todos = Todo.find(:all)
  end
end
