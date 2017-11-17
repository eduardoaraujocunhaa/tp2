require 'gosu'
require_relative 'sprite'
require_relative 'falcon'
require_relative 'hiero'
require_relative 'obstacle'
require_relative 'enemy'

class GameWindow < Gosu::Window
  
  def initialize(width = 640, height = 480, fullscreen = false)
    super
    self.caption = 'Desert Falcon'
    @background_image = Sprite.new('../Sprites/background.png')
    @falcon = Falcon.new
    @font = Gosu::Font.new(30)
    @status = "menu"
    @message = Gosu::Image.from_text(
      'Desert Falcon', 100, 
      {:font => Gosu.default_font_name})
    @hieros = []
    @obstacles = []
    @obstacle
    @timer_hiero = 0
    @timer_obstacle_enemy = 0
    @score = 0
    @enemies = []
    @enemy
  end
# [ :menu, :score, :game, :points ]
  def update
    case @status
    when 'game'
      @timer_hiero += 1
      @timer_obstacle_enemy += 1

      @falcon.update('l') if (Gosu.button_down? Gosu::KbLeft) && @falcon.box.left - 40 > 0 && @falcon.box.top - 40 > 0
      @falcon.update('r') if (Gosu.button_down? Gosu::KbRight) && @falcon.box.right + 40 < width && @falcon.box.bottom + 40 < height

      if @timer_hiero > 150
        @hieros << Hiero.new
        @timer_hiero = 0
      end

      if @timer_obstacle_enemy > 100
        @obstacle = Obstacle.new
        @enemy = Enemy.new
      end

      if @hieros
        @hieros.each do |h|
          if h.box.overlapsWith(@falcon.box) && (@falcon.z < 2)
            @score += 1
            h.destroy
            @hieros.delete(h)
          else
            h.update
            @hieros.delete(h) if h.isDead
          end
          if !h.box.overlapsWith(@obstacle.box) && !@enemy.box.overlapsWith(@obstacle.box) && !h.box.overlapsWith(@enemy.box) && @timer_obstacle_enemy > 100
            @timer_obstacle_enemy = 0
            @obstacles << @obstacle
            @enemies << @enemy
          end
        end
      end

      if @obstacles
        @obstacles.each do |o|
          if o.box.overlapsWith(@falcon.box) && (@falcon.z < 2)
            @status = 'score'
          else
            o.update
            @obstacles.delete(o) if o.isDead
          end
        end
      end

      if @enemies
        @enemies.each do |e|
          if e.box.overlapsWith(@falcon.box) && (@falcon.z == e.z)
            @status = 'score'
          else
            e.update
            @enemies.delete(e) if e.isDead
          end
        end
      end

    when 'menu'
      @info = Gosu::Image.from_text(
      "N = New Game\nS = Scores\nESC = Quit", 30,
      {:font => Gosu.default_font_name})
    end
  end

  def draw
    case @status
    when 'game' 
      @falcon.render
      @background_image.render(0, 0, 0)
      @hieros.each(&:render)
      @enemies.each(&:render)
      @obstacles.each(&:render)
      @font.draw("ALTURA: #{@falcon.z} SCORE: #{@score}", 0, (height - 25), 4, 1, 1, 0xff_ffffff)
    when 'menu'
      @message.draw(
      $window.width / 2 - @message.width / 2,
      $window.height / 2 - @message.height / 2,
      10)
      @info.draw(
      $window.width / 2 - @info.width / 2,
      $window.height / 2 - @info.height / 2 + 150,
      10)
    end
  end

  def button_down(id)
    @status = 'game' if (Gosu.button_down? Gosu::KbN) && @status == 'menu'
    @falcon.update('u') if (Gosu.button_down? Gosu::KbUp) && @falcon.z < 3 && @status == 'game'
    @falcon.update('d') if (Gosu.button_down? Gosu::KbDown) && @falcon.z > 1 && @status == 'game'
    $window.close if id == Gosu::KbEscape
  end
end
