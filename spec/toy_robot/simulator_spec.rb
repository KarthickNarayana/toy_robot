
require "spec_helper"

RSpec.describe ToyRobot::Simulator do
  let(:tableTop){ ToyRobot::TableTop.new(5,5)}
  subject { ToyRobot:: Simulator.new(tableTop) }

  it "places the robot in a valid location" do
    expect(ToyRobot::Robot).to receive(:new).with(0,0, "EAST").and_return(double)
    subject.place(0,0, "EAST")
    expect(subject.robot).not_to be_nil
  end

  it "should not place in an invalid location" do
    expect(ToyRobot::Robot).not_to receive(:new)

    subject.place(5,5, "EAST")
    expect(subject.robot).to be_nil
  end

   context "when robot has been placed" do

    let(:robot) { instance_double(ToyRobot::Robot, next_move: [0, 0]) }
     before { allow(subject).to receive(:robot).and_return(robot) }

       it "tells the robot to move" do
         expect(robot).to receive(:move)
         subject.move
       end

     end
   context "when robot has been placed" do
     let(:robot) { instance_double(ToyRobot::Robot, next_move: [0, 0]) }
     before { allow(subject).to receive(:robot).and_return(robot) }

     it "tells the robot to move" do
       expect(robot).to receive(:move)
       subject.move
       end

     it "tells the robot to turn left" do
       expect(robot).to receive(:turn_left)
       subject.turn_left
       end

     it "tells the robot to turn right" do
       expect(robot).to receive(:turn_right)
       subject.turn_right
       end

     it "tells the robot to report" do
       expect(robot).to receive(:report) { { h_position: 3, v_position: 3, orientation: "EAST" } }
       subject.report
      end
    end



end