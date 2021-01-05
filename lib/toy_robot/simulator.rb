module ToyRobot
  class Simulator

    attr_reader :robot

    def initialize(tableTop)
      @tableTop = tableTop

    end

    def place(h_pos, v_pos, orientation)
      return unless @tableTop.valid_loc?(h_pos, v_pos)

      @robot = Robot.new(h_pos, v_pos, orientation)

    end
    def robot_placed?
       !robot.nil?

    end

     def move
       return unless robot_placed?
       return unless @tableTop.valid_loc?(*robot.next_move)
       robot.move
     end

    def turn_right
      return unless robot_placed?
      robot.turn_right
    end

    def turn_left
      return unless robot_placed?
      robot.turn_left
    end

    def report
      return unless robot_placed?
      location = robot.report
      puts "Robot's final location(x,y) is at (#{location[:h_position]}, #{location[:v_position]}) and oriented towards #{location[:orientation]}"
    end

     def invalid(command)
       puts "'#{command.strip}' is an invalid command"
       end

  end
end
