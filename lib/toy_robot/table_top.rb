module ToyRobot
  class TableTop

    def initialize( w, l)
      @l = l
      @w = w
    end

    #h_pos +x- axis or EAST and v_pos = +y - axis or NORTH

    def valid_loc?(h_pos, v_pos)
      h_pos >= 0 &&  h_pos < @w
      v_pos >= 0 && v_pos < @l

    end

  end
end