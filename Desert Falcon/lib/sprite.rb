require 'gosu'

# Classe responsavel por carregar as sprites, as imagens, do jogo
class Sprite < Gosu::Image
  attr_accessor :image

  def initialize(path)
    @image = Gosu::Image.new(path, tileable: true)
  end

  def destroy; end

  def render(x, y, z)
    @image.draw(x, y, z)
  end
end
