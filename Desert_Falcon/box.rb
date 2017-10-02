class Box
    attr_accessor :left, :bottom, :right, :top
  
    def initialize(left, bottom, width, height)
      @left = left
      @bottom = bottom
      @width = width
      @height = height
      @right = @left + @width
      @top = @bottom + @height
    end

    # o que isse precisa fazer??
    def destroy
    end

    # testa se box sobrepõe self
    def overlapsWith(box)
      self.right > box.left && self.bottom < box.top && self.left < box.right && self.top > box.bottom
    end
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

  • Módulo Box: Este módulo deve guardar a posição X e Y da entidade, além de
sua largura e altura. Deve possuir métodos para checar a intersecção entre duas
entidades.
=end