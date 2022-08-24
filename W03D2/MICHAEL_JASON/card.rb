class Card
    
    attr_reader :face_value, :face_up

    def initialize(face_value)
        @face_value = face_value
        @face_up = false

    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true 
    end

    def to_s #if the card is not revealed, return " " if reveal should return the string value of face value
        if @face_up
            @face_value 
        else
            " "
        end
    end

    def ==(card) #value we calling it on is the same as the other instance is the same 
        #make sure card is another card class 
        
        (self.face_value == card.face_value) && card.is_a?(self.class) 
    end

end