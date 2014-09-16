class TagsController < ApplicationController
 include TagsHelper

  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  def destroy
    Tag.destroy(params[:id])
    
    flash.notice = "Tag '#{params[:id]}' removed!"
    
    redirect_to action: 'index'
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    
    flash.notice = "Tag '#{@tag.name}' updated!"
    
    redirect_to tag_path(@tag)
  end
end
