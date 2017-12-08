require_relative 'gameObject'
require_relative 'box'
require_relative 'sprite'

# Classe responsavel pelos hierogrifos, a pontuacao, do jogo
class Hiero < GameObject
  attr_accessor :box, :z

  def initialize
    @x = rand(0..840)
    @y = rand(-30..10)
    @z = 1
    @image = Sprite.new('../Sprites/hiero.png')
    @box = Box.new(@x, @y, @image.image.width, @image.image.height)
    super(@image, nil, @box, @z)
  end

  # Retira o hiero da tela
  def destroy
    super
  end
  # Verifica se o hiero saiu da tela
  def isdead
    @box.top > 480 && @box.right < 0
  end

  # Atualiza a posição do hiero
  def update
    @box.top += 1
    @box.left -= 1
    @box.bottom += 1
    @box.right -= 1
  end

  # Notifica se houve colisao entre o hiero e o falcon
  def notifycollision(obj); end
end
