require 'gosu'
require_relative 'sprite'
require_relative 'falcon'
require_relative 'hiero'
require_relative 'obstacle'
require_relative 'enemy'
require_relative 'fileManager'

class GameWindow < Gosu::Window
  
  def initialize(width = 640, height = 480, fullscreen = false)
    super
    self.caption = 'Desert Falcon'
    @file_manager = FileManager.new
    @ranking = Gosu::Image.from_text(
      @file_manager.read_players, 30,
      {:font => Gosu.default_font_name})
    @background_image = Sprite.new('../Sprites/background.png')
    @falcon = Falcon.new
    @font = Gosu::Font.new(30)
    @status = "menu"
    @logo = Sprite.new('../Sprites/logo.png')
    @message = Gosu::Image.from_text(
      'Desert Falcon', 100, 
      {:font => Gosu.default_font_name})
    @hieros = []
    @obstacles = []
    @obstacle = nil
    @timer_hiero = 0
    @timer_obstacle_enemy = 0
    @score = 0
    @enemies = []
    @enemy = nil
    @name=Gosu::TextInput.new
    @text_img = Gosu::Image.from_text(
      '', 3, 
      {:font => Gosu.default_font_name})
  end

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
            self.text_input = @name
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
            self.text_input = @name
          else
            e.update
            @enemies.delete(e) if e.isDead
          end
        end
      end
    when 'menu'
      @name.text = ''
      self.text_input = nil
      @info = Gosu::Image.from_text(
      "N = New Game\nS = Scores\nESC = Quit", 30,
      {:font => Gosu.default_font_name})
    when 'score'
      @text_img = Gosu::Image.from_text(
      @name.text, 100, 
      {:font => Gosu.default_font_name})
    when 'points'

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
      @logo.render(120, 60, 10)
      # @message.draw(
      # $window.width / 2 - @message.width / 2,
      # $window.height / 2 - @message.height / 2,
      # 10)
      @info.draw(
      $window.width / 2 - @info.width / 2,
      $window.height / 2 - @info.height / 2 + 150,
      10)
    when 'score'
      @font.draw("Identifique-se com TRÊS caracteres", 110, 80, 4, 1, 1, 0xff_ffffff)
      @text_img.draw(
      $window.width / 2 - @text_img.width / 2,
      $window.height / 2 - @text_img.height / 2,
      10)
    when 'points'
      @font.draw("Press B to return to the Menu", 150, 450, 2, 1, 1, 0xff_ffffff)
      @font.draw("Ranking", 220, 0, 4, 2, 2, 0xff_ffffff)
      @ranking.draw(280,110,10)
      # @ranking.draw(
      # $window.width / 2 - @ranking.width / 2,
      # $window.height / 2 - @ranking.height / 2 + 150,
      # 10)
    end
  end

  def button_down(id)
    @status = 'game' if (Gosu.button_down? Gosu::KbN) && @status == 'menu'
    @status = 'menu' if (Gosu.button_down? Gosu::KbB) && @status == 'points'
    @status = 'points' if (Gosu.button_down? Gosu::KbS) && @status == 'menu'
    if (@status == 'score' && @name.text.length == 3)
      @file_manager.insert_player(@name.text, @score.to_s)
      restart_params()
      @ranking = Gosu::Image.from_text(
      @file_manager.read_players, 30,
      {:font => Gosu.default_font_name})
      @status = 'menu'
    end
    @falcon.update('u') if (Gosu.button_down? Gosu::KbUp) && @falcon.z < 3 && @status == 'game'
    @falcon.update('d') if (Gosu.button_down? Gosu::KbDown) && @falcon.z > 1 && @status == 'game'
    $window.close if id == Gosu::KbEscape
  end

  def restart_params()
    @hieros.clear
    @obstacles.clear
    @enemies.clear
    @falcon = Falcon.new
    @score = 0
  end

end
