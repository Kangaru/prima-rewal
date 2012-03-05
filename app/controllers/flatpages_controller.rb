class FlatpagesController < ApplicationController
  include LocalizedController

  def index
    @flatpage = Flatpage.for_main_page
    render :show
  end

  def show
    @flatpage = Flatpage.find(params[:id])

    unless url_for(@flatpage) == request.url
      return redirect_to flatpage_path(@flatpage), status: :moved_permanently
    end
  end
end