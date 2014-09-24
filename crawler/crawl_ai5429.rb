#!/usr/bin/env ruby

require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

base_url = "http://www.ai5429.com/17/8x/"

def strip_colon(text)
  p "ohei!"
end

for i in 2..2
  page_url = "#{"%05d"%i}.htm"

  url ="#{base_url}#{page_url}"

  page = Nokogiri::HTML(open(url))

  gua_section = page.css("p.MsoNormal[align='left']")

  yaos, xiangs = []

  tuan_text = "彖曰"

  xiang_text = "象曰"

  yao_text = ["初九", "初六", "九一", "六一",
              "九二", "六二", "九三", "六三",
              "九四", "六四", "九五", "六五",
              "上九", "上六"]

  yung_text = ["用九", "用六"]

  flag_text = /[#{[tuan_text, xiang_text, yao_text, yung_text].flatten.join("|")}]/

  gua_array = gua_section.text.split(/[\\n[[:space:]]]+/).reject! { |c| c.empty? }

  binding.pry

  sleep 1
end

