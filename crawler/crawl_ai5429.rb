#!/usr/bin/env ruby

require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

base_url = "http://www.ai5429.com/17/8x/"

for i in 1..64
  page_url = "#{"%05d"%i}.html"

  url ="#{base_url}#{page_url}"

  page = Nokogiri::HTML(open(url))

  gua_section = page.css("p[class='MsoNormal']")

  p gua_section

  sleep 1
end

