require 'ostruct'
class DefaultConfig
  attr_reader :ball
  attr_reader :paddle
  attr_reader :pong

  def self.init(&block)
    @init_block = block
  end

  def self.init_block
    @init_block || Proc.new {}
  end

  def initialize
    @ball, @paddle, @pong = (1..3).map { OpenStruct.new }

    pong.width = 768
    pong.height = 576

    # Color can be any of:
    #
    # :black
    # :gray
    # :white
    # :aqua
    # :red
    # :green
    # :blue
    # :yellow
    # :fuchsia
    # :cyan
    ball.color = :red
    ball.size = 10
    ball.speed = 6

    paddle.color = :white
    paddle.width = 16
    paddle.height = 96
    paddle.speed = 6

    instance_eval &self.class.init_block
  end
end
