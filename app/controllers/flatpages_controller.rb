class FlatpagesController < ApplicationController
  def index
    @flatpage = Flatpage.for_main_page
    render :show
  end

  def show
    @flatpage = Flatpage.find(params[:id])
  end
end