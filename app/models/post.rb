class Post < ActiveRecord::Base
  include AASM

  belongs_to :member

  def self.bu_gua
    gua = []
    6.times do
      yao = 0
      3.times do
        Random.new
        yao = yao + rand(2..3)
      end
      gua << yao
    end
    gua
  end

  def gua
    self.bu_result.split(',').map{|x| x.to_i % 2}
  end

  def bian_gua
    self.bu_result.split(',').map do |x|
      x = x.to_i
      x = x + 1 if x == 9 or x == 6
      x % 2
    end
  end

  def yijing
    yijing = YAML.load_file("crawler/yijing.yml")
    yijing[self.gua.join ',']
  end

end
