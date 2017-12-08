require 'gosu'

# Classe responsavel por carregar as sprites, as imagens, do jogo
class Sprite < Gosu::Image
  attr_accessor :image

  def initialize(path)
    @image = Gosu::Image.new(path, tileable: true)
  end

  # Retira a sprite da tela
  def destroy; end

  # Carrega na tela as sprites 
  def render(x, y, z)
    @image.draw(x, y, z)
  end
end
