require 'print'

class PrintController < ApplicationController
  include MapFish::Print::Controller

  def initialize
    @configFile = "#{RAILS_ROOT}/config/print.yaml"
  end
end
