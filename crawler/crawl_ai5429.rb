#!/usr/bin/env ruby

require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

base_url = "http://www.ai5429.com/17/8x/"

for i in 1..1
  page_url = "#{"%05d"%i}.htm"

  url ="#{base_url}#{page_url}"

  page = Nokogiri::HTML(open(url))

  gua_section = page.css("p.MsoNormal[align='left']")

  p gua_section.text.split(/[\\n[[:space:]]]+/).reject! { |c| c.empty? }

  sleep 1
end

