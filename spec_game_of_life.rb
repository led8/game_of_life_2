# SPEC FILE

# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.syntax = :should
#   end
# end

require 'rspec'
require_relative 'game_of_life.rb'


describe 'Game of life' do
  let!(:world) { World.new }

  context 'World' do
    subject { World.new }

    it "should create a new world object" do
      subject.is_a?(World).should be true
    end

    it "should respond to its proper methods" do
      subject.should respond_to(:rows)
      subject.should respond_to(:cols)
      subject.should respond_to(:cell_grid)
      subject.should respond_to(:live_neighbours_around_cell)
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

    it "should detect a neighbour to the North" do
      subject.cell_grid[0][1].should be_dead
      subject.cell_grid[0][1].alive = true
      subject.cell_grid[0][1].should be_alive
      expect(subject.live_neighbours_around_cell(subject.cell_grid[1][1])).to eq(1)
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
      subject.should respond_to(:alive?)
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

    it "should initialize properly" do
      subject.world.is_a?(World).should be true
      subject.seeds.is_a?(Array).should be true
    end

    it "should plant seeds properly" do
      game = Game.new(world, [[1,2],[0,2]])
      world.cell_grid[1][2].should be_alive
    end

  end

  context 'Rules' do
    let!(:game) { Game.new }

    context 'Rule n°1 : Any live cell with two or three live neighbours survives' do

      it 'should kill a live cell with 1 neighbour' do
        game = Game.new(world, [[1,0],[2,0]])
        game.tick!
        world.cell_grid[1][0].should be_dead
        world.cell_grid[2][0].should be_dead
      end

      it 'should kill a live cell with 4 or more neighbours' do
      end

    end
  end

end
