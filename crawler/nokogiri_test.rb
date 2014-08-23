#!/usr/bin/env ruby

require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

base_url = "http://www.eee-learning.com"
ini_url = "/article/571"

url = "#{base_url}#{ini_url}"

page = Nokogiri::HTML(open(url))

full_table = page.css('table[align="center"]');

html_guas = page.xpath("//table[@align='center']/tbody/tr/td[a]")

guas_ordered = Array.new(64)

html_guas.each do |html_gua|
  gua_info = Hash.new

  href = html_gua.css("a").map{|a| a['href'] }.uniq.first
  url = "#{base_url}#{href}"

  page = Nokogiri::HTML(open(url))

  page_strongs = page.css("strong").map{|strong| strong.text }

  yaos = page_strongs.map { |strong|
    if strong[/九/]
      1
    elsif strong[/六/]
      2
    end
  }.compact

  if yaos.count == 7
    #yaos.pop
  end

  gua_xiang = yaos.join(',')

  gua_order = page.css('h1').text.match(/\d+/)[0].to_i

  gua_name = page.css("h1").text.match(/\.(.+)/)[1].delete(" ").delete("卦")

  gua_ci = page_strongs[1].sub(/(\p{Han}|\p{Han}\p{Han})，/,"")

  tuan = page.css("body p").map{ |p| p.text if p.text["彖"] }.compact.first

  xiangs = page.css("body p").map{ |p| p.text if p.text["象"]}.compact

  da_xiang = xiangs.first

  yaos_info = []

  page_strongs.shift(2)
  yaos.each_index do |index|
    yao_info = {
      "yao_ci" => page_strongs[index],
      "xiao_xiang" => xiangs[index + 1]
    }

    yaos_info << (yao_info)
  end

  gua_info = {
    "#{gua_xiang}" => {
      "gua_order" => gua_order,
      "gua_name" => gua_name,
      "gua_ci" => gua_ci,
      "tuan" => tuan,
      "da_xiang" => da_xiang,
      "yaos" => yaos_info
    }
  }

  guas_ordered[gua_order - 1] = gua_info

  p gua_name
  #sleep 1
end

guas_hash = {}

guas_ordered.each do |gua|
  guas_hash.merge! gua
end

File.open("test.yml", "w") {|f| f.write(guas_hash.to_yaml)}

p guas_ordered.count


p "<<IMPORTANT>> Remember to go back and add 1st and 2nd usage!!!"
