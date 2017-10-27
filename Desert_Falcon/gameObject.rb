class GameObject
  attr_accessor :box

  def initialize(image, box, z)
    @image = image
    @box = box
    @z = z
  end

  def destroy
    @box.bottom = 0
    @box.top = 0
    @box.right = 0
    @box.left = 0
    @z = 0
  end

  def update; end

  def render
    @image.render(@box.left, @box.bottom, @z)
  end

  def isEqual(obj); end

  def isDead; end

  def notifyCollision(obj); end
end
