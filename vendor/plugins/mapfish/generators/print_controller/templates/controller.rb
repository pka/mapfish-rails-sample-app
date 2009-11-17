require 'print'

class <%= class_name %>Controller < ApplicationController
  include MapFish::Print::Controller

  def initialize
    @configFile = "#{RAILS_ROOT}/config/print.yaml"
  end
end
