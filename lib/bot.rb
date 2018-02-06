# frozen_string_literal: true

# Toy Robot Simulator challenge
class Bot
  DIRECTIONS = %w[WEST SOUTH EAST NORTH].freeze

  def initialize(inpt)
    arr = inpt.split(/[\s,']/)
    @x = arr[1].to_i
    @y = arr[2].to_i
    @face = arr[3]
  end

  # It validate input command, robot position on board.
  def dimention
    return unless valid_position?
    bot_command
  end

  # Execute various commands given by user.
  def bot_command
    puts 'Please enter any command MOVE, LEFT, RIGHT or REPORT'
    case gets.strip
    when 'REPORT' then report
    when 'MOVE' then move
    when 'LEFT' then turn('LEFT')
    when 'RIGHT' then turn('RIGHT')
    else puts 'Please enter correct command' 
         bot_command
    end
  end

  # Move rebot in direction of robot face.
  def move
    case @face
    when 'NORTH' then @y += 1
    when 'SOUTH' then @y -= 1
    when 'EAST' then @x += 1
    when 'WEST' then @x -= 1
    else puts 'Be Happy :)'
    end
    adjust_move unless valid_position?
    bot_command
  end

  # In case, user move the robot out of the robot, it stop robot to fall.
  def adjust_move
    puts 'Invalid move! Press Y to try again'
    return unless input.chomp.eql? 'Y'
    @x = 0 if @x.negative?
    @y = 0 if @y.negative?
    @x = 5 if @x > 5
    @y = 5 if @y > 5
  end

  # Turn robot in left / right direction.
  def turn(direction)
    index = DIRECTIONS.index(@face)
    if direction.eql?('LEFT')
      @face = DIRECTIONS.rotate[index]
    elsif direction.eql?('RIGHT')
      @face = DIRECTIONS.rotate(-1)[index]
    end
    bot_command
  end

  # Check input position of robot given by user.
  def valid_position?
    flag = (@x <= 5 &&
      @x >= 0 &&
      @y <= 5 &&
      @y >= 0 &&
      DIRECTIONS.include?(@face))
    puts 'Please enter correct input' unless flag
    flag
  end

  # It execute to return robot position.
  def report
    [@x, @y, @face].join(',')
  end
end

# This file can be run on terminal to test the code.
# Following commands can be tried.
# MOVE
# LEFT
# RIGHT
# REPORT
inpt = 'PLACE 2,1,NORTH'
p Bot.new(inpt).dimention
