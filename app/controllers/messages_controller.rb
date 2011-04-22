class MessagesController < ApplicationController
  def index
     @messages=Message.all
     render :layout => false 
  end

  def show
  end

  def new
     @message=Message.new
     render :layout => false 
  end

  def create
     @message = Message.new(params[:message])
     
     respond_to do |format|  
        if @message.save    
          format.js 
        else 
          format.html { render :controller=>"pages", :action => "home" }
        end
     end

  end

end
