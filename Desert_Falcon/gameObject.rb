class GameObject
    def initialize(image, box, z)        
        @image = image
        @box = box
        @z = z
    end

    def destroy
    end

    def update
    end

    def render
        @image.render(@box.left, @box.bottom, @z)
    end

    def isEqual(obj)
    end

    def isDead
    end

    def notifyCollision(obj)
    end 
end

=begin 
public :
    c o n s t r u t o r ( x : int , y : int , z : int )
    destrutor ()
    update ( )
    render ()
    i s E q u a l ( o t h e r : GameObject ) : b o o l
    isDead ( ) : bool
    n o t i t y C o l l i s i o n ( o t h e r : GameObject ) : b o o l
    
    • Módulo GameObject: Este módulo deve possuir métodos que sejam comuns a
    qualquer entidade, como, por exemplo, ser capaz de desenhar a imagem associada
    a si próprio e detectar quando há uma colisão.
    
=end