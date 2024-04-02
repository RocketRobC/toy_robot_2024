# frozen_string_literal: true

require_relative "toy_robot_2024/version"
require_relative "toy_robot_2024/app"
require_relative "toy_robot_2024/board"
require_relative "toy_robot_2024/direction"
require_relative "toy_robot_2024/file_interpreter"
require_relative "toy_robot_2024/terminal_output"

module ToyRobot2024
  class Error < StandardError; end
  # Your code goes here...
  BOARD_SIZE = { x: 4, y: 4 }
end
