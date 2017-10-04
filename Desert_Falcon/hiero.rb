require_relative 'gameObject'
require_relative 'box'
require_relative 'sprite'

class Hiero < GameObject
  attr_accessor :box


  SPEED = 200

      def initialize
        @x = rand * 640
        @y = rand * 480
        @z = 1
        @image = Sprite.new("../Sprites/hiero.png")
        @box = Box.new(@x, @y, @image.image.width, @image.image.height)
        super(@image, @box, @z)
      end

      def calculate_delta
        @this_frame = Gosu::milliseconds
        @delta = (@this_frame - @last_frame) / 1000.0
        @last_frame = @this_frame
      end

      def update(delta)
        super
        @box.top -= 10 * SPEED
        @box.left -= 10 * SPEED
        @box.bottom -= 10 * SPEED
        @box.right -= 10 * SPEED
      end

      def notifyCollision(obj)
      end
end
