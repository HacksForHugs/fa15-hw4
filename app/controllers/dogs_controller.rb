class DogsController < ApplicationController
  def index
    @dogs = Dog.all # Get's all the Users in our database and assigns it the the instance variable @user.
  end

  def new
    @dog = Dog.new #Creates an empty user object.
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.save #If saving the user was successful
      redirect_to @dog #Go to the show view of the user
    else
      render "new" #Go to the new view for the user
    end
  end

  def show
    @dog = Dog.find(params[:id]) 
  end

  private

  def user_params
    params.require(:dog).permit(:name, :age) #Returns a hash that was the value of "name" and "email" from the value of "user" in params.
  end


end
