class Box

end

=begin
public :
c o n s t r u t o r ( x : int , y : int , w : int , h : int )
destrutor ()
o v e r l a p s W i t h ( o t h e r : GameObject ) : b o o l


class BoundingBox
    attr_reader :left, :bottom, :width, :height, :right, :top
  
    def initialize(left, bottom, width, height)
      @left = left
      @bottom = bottom
      @width = width
      @height = height
      @right = @left + @width
      @top = @bottom + @height
    end
  
    def collide?(x, y)
      x >= left && x <= right && y >= bottom && y <= top
    end
  
    def intersects?(box)
      self.right > box.left && self.bottom < box.top && self.left < box.right && self.top > box.bottom
    end
  end
=end