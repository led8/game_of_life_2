# BASIC FILE

class Game
  attr_accessor :world, :seeds

  def initialize(world=World.new, seeds=[])
    @world  = world
    @seeds  = seeds

    seeds.each do |seed|
      world.cell_grid[seed[0]][seed[1]].alive = true
    end
  end
end



class World
  attr_accessor :rows, :cols, :cell_grid

  def initialize(rows=3,cols=3)
    @rows = rows
    @cols = cols

  # [

  #  [Cell.new, Cell.new, Cell.new],
  #  [Cell.new, Cell.new, Cell.new],
  #  [Cell.new, Cell.new, Cell.new]

  # ]

    @cell_grid = Array.new(rows) do |row|
                  Array.new(cols) do |col|
                    Cell.new(col, row)
                  end
                end
  end

  def live_neighbours_around_cell(cell)
    live_neighbours = []

    # should detect a neighbour to the North

    if cell.y > 0
      candidate = self.cell_grid[cell.y - 1][cell.x]
      live_neighbours << candidate if candidate.alive?
    end

    return live_neighbours
  end
end



class Cell
  attr_accessor :alive, :x, :y

  def initialize(x=0, y=0)
    @alive = false
    @x     = x
    @y     = y
  end

  def alive?
    return alive
  end

  def dead?
    return !alive
  end
end

game = Game.new
p game.world.live_neighbours_around_cell(game.world.cell_grid[1][1])

