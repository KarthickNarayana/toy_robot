
require 'spec_helper'

RSpec.describe ToyRobot::TableTop do
  subject {ToyRobot::TableTop.new(5, 5)}

  context "is it a valid_loc ?" do
    it {should be_valid_loc(0,0)}
    it {should be_valid_loc(4,4)}
    it {should_not be_valid_loc(5,5)}
    it {should_not be_valid_loc(-1,-1)}
  end


end
