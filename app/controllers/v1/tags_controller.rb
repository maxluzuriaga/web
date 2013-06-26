class V1::TagsController < ApplicationController
  
  respond_to :json
  
  # GET /tags.json
  def index
    @tags = Tag.all
    
    respond_with @tags
  end

  # GET /tags/1.json
  def show
    @tag = Tag.find_by_tag_text(params[:id])
    
    respond_with @tag
  end
  
end
