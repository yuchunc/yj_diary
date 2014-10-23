class Post < ActiveRecord::Base
  include AASM

  belongs_to :member

  paginates_per 10

  GUA_ORDER = ['初', '二', "三", "四", '五', '上']

  scope :latest, -> { order("created_at DESC") }

  aasm column: 'state' do
    state :published, :initial => true
    state :deleted

    event :remove do
      transitions :from => :published, :to => :deleted
    end
  end

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

  def gua_info
    yijing = YAML.load_file("crawler/yijing.yml")
    yijing[self.gua.join ',']
  end

  def bian_gua_info
    yijing = YAML.load_file("crawler/yijing.yml")
    yijing[self.bian_gua.join ',']
  end

  def self.yijing
    YAML.load_file("crawler/yijing.yml")
  end

  def yaos_position(which_gua)
    yaos = []
    self.send(which_gua).each_with_index do |yao, index|
      yao_name = yao > 0 ? "九" : "六"
      yao_text =  ( index == 0 or index == 5 ) ? "#{Post::GUA_ORDER[index]}#{yao_name}" : "#{yao_name}#{Post::GUA_ORDER[index]}"
      yaos << yao_text
    end
    yaos
  end

end
