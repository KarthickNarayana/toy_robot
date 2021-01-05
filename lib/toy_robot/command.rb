module ToyRobot
  class Command

    def self.process(command_string)
      case command_string
       when /\APLACE (?<x>\d+),(?<y>\d+),(?<orientation>\w+)\Z/
      [:place, $~[:x].to_i, $~[:y].to_i, $~[:orientation]]
       when /\AMOVE\Z/
       [:move]
      when /\ALEFT\Z/
        [:turn_left]
      when /\ARIGHT\Z/
        [:turn_right]
      when /\AREPORT\Z/
        [:report]
       else
           [:invalid, command_string]
      end

    end



  end
end


