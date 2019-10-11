class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
  end

  def average_age
    @astronauts = Astronaut.all
    @astronauts.average_age
  end

end
