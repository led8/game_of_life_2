# SPEC FILE

# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.syntax = :should
#   end
# end

require 'rspec'
require_relative 'game_of_life.rb'


describe 'Game of life' do

  context 'World' do
    subject { World.new }

    it "should create a new world object" do
      subject.is_a?(World).should be true
    end

    it "should respond to its proper methods" do
      subject.should respond_to(:rows)
      subject.should respond_to(:cols)
      subject.should respond_to(:cell_grid)
    end

    it "should create proper cell grid on initialization" do
      subject.cell_grid.is_a?(Array).should be true

      subject.cell_grid.each do |row|
        row.is_a?(Array).should be true
      end
    end

  end

  context 'Cell' do
    subject { Cell.new }

    it 'should create a new Cell object' do
      subject.is_a?(Cell).should be true
    end
  end

end
