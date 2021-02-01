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
        row.each do |col|
          col.is_a?(Cell).should be true
        end
      end
    end

  end

  context 'Cell' do
    subject { Cell.new }

    it 'should create a new Cell object' do
      subject.is_a?(Cell).should be true
    end

    it "should respond to its proper methods" do
      subject.should respond_to(:alive)
      subject.should respond_to(:x)
      subject.should respond_to(:y)
    end

    it "should properly initialize" do
      subject.alive.should be false
      subject.x.should be 0
      subject.y.should be 0
    end

  end

  context 'Game' do
    subject { Game.new }

    it 'should create a new Game object' do
      subject.is_a?(Game).should be true
    end

    it 'should respond to its proper methods' do
      subject.should respond_to(:world)
      subject.should respond_to(:seeds)
    end

    it "should properly initialize" do
      subject.world.is_a?(World).should be true
      subject.seeds.is_a?(Array).should be true
    end

  end

  context 'Rules' do
    let!(:game) { Game.new }

    context 'Rule n°1 : Any live cell with two or three live neighbours survives' do

      it 'should kill a live cell with 1 neighbour' do
      end

      it 'should kill a live cell with four or more neighbours' do
      end

    end
  end

end
