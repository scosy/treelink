class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page
  before_action :set_link, only: %i[show edit update destroy]

  def index
    @links = @page.links
  end

  def show
  end

  def new
    @link = @page.links.new
  end

  def edit
  end

  def create
    @link = @page.links.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to page_link_url(@page.id, @link.id), notice: "Link was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to page_link_url(@page.id, @link.id), notice: "Link was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy!

    respond_to do |format|
      format.html { redirect_to page_links_url(@page.id), notice: "Link was successfully destroyed." }
    end
  end

  private

  def set_page
    @page = current_user.pages.find(params[:page_id])
  end

  def set_link
    @link = @page.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :source, :page_id)
  end
end
