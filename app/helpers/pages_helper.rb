# coding: utf-8
require "open-uri"
require "iconv"
module PagesHelper

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
  def getprize(num)
    url="http://hq.sinajs.cn/list=sh"+num
    uri = URI.parse(url)
    str=uri.read
    str=Iconv.conv('utf-8','gbk',str)
    start=str.index('="')
    last=str.index('";')
    result=str[start+2,last]
    result=result.split(',')
    name=result[0]
    lprize=result[2].to_f
    cprize=result[3].to_f
    today_increase=((cprize-lprize)/lprize*100).round(2)
    return [name,cprize,today_increase]
  end

  def islilyuser?(name)
    url="http://bbs.nju.edu.cn/bbsqry?userid="+name
    uri = URI.parse(url)
    str=uri.read
    str=Iconv.conv('utf-8','gbk',str)
    if str.include? "不存在"
        return false
    else
      return true
    end
  end


  def name
    name="我的名字"
  end
end
