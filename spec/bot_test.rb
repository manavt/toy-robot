# frozen_string_literal: true

require_relative '../lib/bot.rb'
require 'spec_helper'
describe Bot do
  context 'Testing valid input with method' do
    it 'should return true when we send valid input to valid_position?' do
      inpt = 'PLACE 2,1,NORTH'
      bot = Bot.new(inpt)
      is_valid = bot.valid_position?
      expect(is_valid).to be == true
    end
  end

  context 'Testing REPORT command - report' do
    it 'It should return output string format as N,N,NORTH' do
      inpt = 'PLACE 2,4,NORTH'
      report = Bot.new(inpt).report
      expect(report).to eq '2,4,NORTH'
    end
  end

  context 'Testing turn method' do
    it 'It should return updated face direction in format N,N,NORTH' do
      inpt = 'PLACE 1,1,NORTH'
      bot = Bot.new(inpt)
      bot.turn('LEFT')
      report = bot.report
      expect(report).to eq '1,1,WEST'
    end
  end

  context 'Testing move method' do
    it 'It should return output after moving one step in format N,N,NORTH' do
      inpt = 'PLACE 2,4,EAST'
      bot = Bot.new(inpt)
      bot.move
      report = bot.report
      expect(report).to eq '3,4,EAST'
    end
  end

  context 'Testing bot_command method' do
    it 'It should return output after moving one step in format N,N,NORTH' do
      inpt = 'PLACE 2,4,EAST'
      bot = Bot.new(inpt)
      bot.stub(:gets) { 'REPORT' }
      expect(bot.bot_command).to eq '2,4,EAST'
    end
  end
end
