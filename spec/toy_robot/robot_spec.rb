require "spec_helper"

RSpec.describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0, 0, "NORTH") }

  it 'moves 3 spaces east ' do
    3.times { subject.move_east }
    expect(subject.h_position).to eq(3)
  end

  it 'moves 5 spaces east ' do
    5.times { subject.move_east }
    expect(subject.h_position).to eq(5)
  end

  it 'moves 2 spaces west' do
    2.times {subject.move_west}
    expect(subject.h_position).to eq(-2)
  end

  it 'moves 3 spaces to west' do
    3.times{subject.move_west}
    expect(subject.h_position).to eq(-3)
  end

  it 'moves 1 spaces to North' do
    1.times{subject.move_north}
    expect(subject.v_position).to eq(1)
  end

  it 'moves 1 spaces to South' do
    1.times{subject.move_south}
    expect(subject.v_position).to eq(-1)
  end

  context "when facing north"  do
    subject { ToyRobot::Robot.new(0, 0, "NORTH") }

    it "moves north" do
      subject.move
      expect(subject.v_position).to eq(1)
    end

    it "turns right to face east" do
      subject.turn_right
      expect(subject.orientation).to eq("EAST")
    end

    it "turns left to face west" do
    subject.turn_left
    expect(subject.orientation).to eq("WEST")
    end
    it "next move is to (0, 1)" do
      expect(subject.next_move).to eq([0, 1])
      end
  end

  context "when facing south"  do
    subject { ToyRobot::Robot.new(0, 0, "SOUTH") }
    it "moves south" do
      subject.move
      expect(subject.v_position).to eq(-1)
    end

    it "turns right to face west" do
      subject.turn_right
      expect(subject.orientation).to eq("WEST")
    end

    it "turns left to face east" do
      subject.turn_right
      expect(subject.orientation).to eq("WEST")
    end

  end
  context "when facing east"  do
    subject { ToyRobot::Robot.new(0, 0, "EAST") }
    it "moves east" do
      subject.move
      expect(subject.h_position).to eq(1)
    end

    it "turns right to face South" do
      subject.turn_right
      expect(subject.orientation).to eq("SOUTH")
    end

    it "turns left to face north" do
      subject.turn_left
      expect(subject.orientation).to eq("NORTH")
    end

  end

  context "when facing west"  do
    subject { ToyRobot::Robot.new(0, 0, "WEST") }
    it "moves west" do
      subject.move
      expect(subject.h_position).to eq(-1)
    end

    it "turns right to face North" do
      subject.turn_right
      expect(subject.orientation).to eq("NORTH")
    end

    it "turns left to face south" do
      subject.turn_left
      expect(subject.orientation).to eq("SOUTH")
    end

  end

  context " the report method" do
    subject  {ToyRobot:: Robot.new(2,3,"NORTH")}

    it "output the current h_pos and v_pos and orientation of the toy" do
      expect(subject.report).to eq({
                                     h_position:2,
                                     v_position:3,
                                     orientation:"NORTH"
                                   })
    end

  end
end