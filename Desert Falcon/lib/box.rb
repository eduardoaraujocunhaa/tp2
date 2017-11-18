# Classe responsavel pela hitbox do jogo
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
  def destroy; end

  # testa se box sobrepoe self
  def overlapswith(box)
    (right - 10) > box.left &&
      (left + 10) < box.right && bottom < box.top && top > box.bottom
  end
end
