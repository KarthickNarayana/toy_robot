1 #!/usr/bin/env ruby

require 'toy_robot'

 cli = ToyRobot::CLI.new
 commands = cli.load_commands(ARGV[0])
 cli.run(commands)