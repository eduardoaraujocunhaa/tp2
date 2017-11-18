class GameObject
  attr_accessor :box

  def initialize(image, shadow, box, z)
    @image = image
    @shadow = shadow
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
    @shadow.render(@box.left, @box.bottom - @z * 10, @z) if @shadow
  end

  def isEqual(obj); end

  def isDead; end

  def notifycollision(obj); end
end
