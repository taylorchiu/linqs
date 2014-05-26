class LinksController < ApplicationController

  before_action :find_link , only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  before_filter :authenticate_user!
  #before_filter :check_link_owner, only: [:edit, :update, :destroy]
  # not currently being used; we may want to set our SPA homepage to main


  def main
  end

# will eventually display all public links via ajax get request
  def index

     # @links = Link.includes((:tag).where.not{:name => "private"})
        @links = Link.all
       # Link.where(:link_id => Link.id, tag.name => " private")
         # @links.each do |link|
         # @tag = link.tags.where.not(name: "private")
       # :domains => { :name => "pauls-domain"}})
       
      # end
  end

# should build new tags associated with the new link - is this working??
  def new
    @link = Link.new
    #@link.user = current_user
    @link_tag = @link.link_tags.build
    @link_tag.build_tag
  end

# will send new instance of link via ajax post to db and retrieves json for same link to display on page without reloading
  def create
    @link = Link.new(links_params)

   

    @link[:user_id] = current_user.id
    if @link.save

      redirect_to link_path(@link)
    else
      flash[:errors] = @link.errors.full_messages
    end

  end

# shows details of a single link, including all tags assoc'd with it
  def show
    #@link = Link.find(params[:id])
    @title = @link.title
    @url = @link.url
  end

# loads link and assoc'd tags to edit
  def edit

   # @link = Link.find(params[:id])
    @link_tag = @link.link_tags.build
    @link_tag.build_tag

    @link = Link.find(params[:id])
  end

 # will send updated link attributes via ajax post 
  def update
    #@link = Link.find(params[:id])
    if @link.update(links_params)
      redirect_to link_path(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

    def destroy
      #@link = Link.find(params[:id])
      @link.destroy
      redirect_to root_path
    end
 #  def destroy
   #   @link = Link.find(params[:id])
     
   #   if @link.user != current_user
   #     flash[:notice] = 'That link is not yours to destory'

   #     respond_to do |format|
   #       format.html { redirect_to :singin_path }
   #       format.json { head :no_content }
   #     end
   #   else
   #     @link.destroy

   #     respond_to do |format|
   #       format.html { redirect_to links_url }
   #       format.json { head :no_content }
   #     end
   #   end
 #   end

    private
    def find_link
      @link = Link.find(params[:id])
    end
    def links_params
      params.require(:link).permit(:title, :url, link_tags_attributes: [tag_attributes: [:name] ])
    end
  end
