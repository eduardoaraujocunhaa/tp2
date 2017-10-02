require 'GameObject'

class Hiero < GameObject
    
end
    
=begin 
    public :
        c o n s t r u t o r ( x : int , y : int , z : int )
        update ( )
        n o t i t y C o l l i s i o n ( o t h e r : GameObject ) : b o o l
    

class Scissors
    attr_accessor :state
    def initialize(x, y, window)
      @paper_image = Gosu::Image.new(window, 'img/scissors.png')
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
end =end