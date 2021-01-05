module ToyRobot
  class Error < StandardError; end

  # Your code goes here...

  class Robot
    ORIENTATIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

    attr_reader :h_position, :v_position, :orientation

    #initializing at origin(0,0) - facing north
    def initialize(h_position = 0, v_position = 0, orientation = "NORTH")
      @h_position = h_position
      @v_position = v_position
      @orientation = orientation
    end

    #moving to west  or towards  the - x-axis direction
    def move_west
      @h_position -= 1
    end

    #moving in the east direction or towards the + x-axis direction
    def move_east
      @h_position += 1
    end

    #moving in the North direction or towards the + y-axis direction
    def move_north
      @v_position += 1
    end

    def move_south
      @v_position -= 1
    end

    def move
      case @orientation
      when "NORTH" then
        move_north
      when "SOUTH" then
        move_south
      when "EAST" then
        move_east
      when "WEST" then
        move_west
      end

    end

    def turn_right

      turn(:right)

    end

    def turn_left

      turn(:left)

    end

    def turn (leftOrRight)

      index = ORIENTATIONS.index(@orientation)
      rotation = leftOrRight == :right ? 1 : -1
      @orientation = ORIENTATIONS.rotate(rotation)[index]
    end


    def report
      {
        h_position: h_position,
        v_position: v_position,
        orientation: orientation

      }
    end

    def next_move

      case @orientation
       when "NORTH"
      [@h_position, @v_position + 1]
       when "SOUTH"
       [@h_position, @v_position - 1]
      when "EAST"
       [@h_position + 1, @v_position]
       when "WEST"
       [@h_position - 1, @v_position]
       end
     end


  end  #end of class

end