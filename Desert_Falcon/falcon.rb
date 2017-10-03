class Falcon < GameObject

  def initialize
    @falcon = Sprite.new("../Sprites/falcon.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
   @angle -= 4.5
 end

 def turn_right
   @angle += 4.5
 end

 def accelerate
   @vel_x += Gosu.offset_x(@angle, 0.5)
   @vel_y += Gosu.offset_y(@angle, 0.5)
 end

 def move
   @x += @vel_x
   @y += @vel_y
   @x %= 640
   @y %= 480

   @vel_x *= 0.95
   @vel_y *= 0.95
 end


  def draw
    @falcon.draw_rot(@x, @y, @angle)
  end

end

=begin
  public :
    c o n s t r u t o r ( x : int , y : int , z : int )
    update ( )
    n o t i t y C o l l i s i o n ( o t h e r : GameObject ) : b o o l

    Oclass Scissors
    attr_accessor :state
    def initialize(x, y, window)
      @paper_image = Gosu::Image.new(window, path)
      @x = x
      @y = y
      @state = :unselected
    end

    def bounds
      BoundingBox.new(@x, @y, 150, 150)
    end

    def draw
      @paper_image.draw(@x, @y, 0)
    end

    def update
      if @state == :selected
        @x = 400
        @y = 400
      end
    end
  end
=end
