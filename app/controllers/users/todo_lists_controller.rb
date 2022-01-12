class Users::TodoListsController < ApplicationController
  def index
    @todo_lists = current_user.todo_lists
  end

  def show
    set_todo_list
  end

  def new
    @user = current_user
    current_user.todo_lists.build
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)
  end

  private
    def set_todo_list
      @todo_list = current_user.todo_lists.find(params[:id])
    end
end
