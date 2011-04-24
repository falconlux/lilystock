class PagesController < ApplicationController
  def home
       
  end

  def about
    @stock_number=params[:stock_number].to_s
    if(params[:lilyid])
      @lilyid=params[:lilyid].to_s
    end
      render :layout => false 
  end

  def help
     render :layout => false 
  end

end
