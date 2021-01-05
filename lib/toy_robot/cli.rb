 module ToyRobot
   class CLI
     def initialize
       table_top = ToyRobot::TableTop.new(5, 5)
       @simulator = ToyRobot::Simulator.new(table_top)
     end

     attr_reader :simulator
     def load_commands(commands_file)
        File.readlines(commands_file).map do |command|
          ToyRobot::Command.process(command)
          end
     end


     def run(commands)
       commands.each do |command, *args|
         simulator.send(command, *args)
       end
     end

   end


 end