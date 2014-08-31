class Post < ActiveRecord::Base
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
end
