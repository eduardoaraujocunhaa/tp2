require 'gosu'

class Sprite < Gosu::Image 
    attr_accessor :image

    def initialize(path)
        @image = Gosu::Image.new(path, :tileable => true)
    end
        
    def destroy
    end

    def render(x, y, z)
        @image.draw(x, y, z)
    end
    
end

=begin 
Módulo Sprite: Este módulo deve ser guardar a imagem e de manipulá-la quando
necessário. Cada entidade do jogo que herda de GameObject terá sua própria
imagem. 
=end