class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owned_pic, only: [:edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pic = current_user.pics.build
  end
    
  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Your image was successfully created! "
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Pic was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to pic_path, notice: 'Pic was successfully destroyed.'
  end

  def upvote
    @pic.upvote_by current_user 
    redirect_to :back
  end

 private 
   
  def pic_params
   params.require(:pic).permit(:title, :description, :image, :slug)   
  end 

  def find_pic
    @pic = Pic.friendly.find(params[:id]) 
  end

  def owned_pic
    unless current_user == @pic.user
      flash[:alert] = "That picture doesn't belong to you!"
      redirect_to root_path
    end 
  end
    
end
