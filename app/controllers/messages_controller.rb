# coding: utf-8
require "open-uri"
require "iconv"
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
     prize=getprize @message.stock_number
     @message.price_nominate=prize
     respond_to do |format|  
        if @message.save    
          format.js 
        end
     end

  end
  private

  def getprize(num)
    url="http://hq.sinajs.cn/list=sh"+num
    uri = URI.parse(url)
    str=uri.read
    str=Iconv.conv('utf-8','gbk',str)
    start=str.index('="')
    last=str.index('";')
    result=str[start+2,last]
    result=result.split(',')
    cprize=result[3]
    return cprize
  end

  def isrightnum?(num)
    url="http://hq.sinajs.cn/list=sh"+num
    uri = URI.parse(url)
    str=uri.read
    str=Iconv.conv('utf-8','gbk',str)
    if str.length >30
      return true
    else 
      return false
    end
  end
end
