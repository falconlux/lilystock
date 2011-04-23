# coding: utf-8
require "open-uri"
require "iconv"
module MessagesHelper
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

  def getprice_nominate(lilyid)
    m=Message.where(:lilyid=>lilyid)
    return m.price_nominate
  end

  def getdetail(num)
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
    if lprize>0
    today_increase=((cprize-lprize)/lprize*100).round(2)
    else 
      today_increase=0
    end
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


end
