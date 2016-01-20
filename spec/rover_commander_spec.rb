require 'spec_helper'

RSpec.describe MarsMission::RoverCommander do
  let (:commander) { MarsMission::RoverCommander.new(rover: double("MarsMission::Rover")) }

  describe '#initialize' do
    it 'should have reference to rover' do
      expect(commander.rover).not_to be_nil
    end
  end

  context 'rover at position 1 2 N' do
    let (:instructions) { 'LMLMLMLMM' }
    let (:rover) { MarsMission::Rover.new(location: [1, 2], direction: 'N') }
    let (:commander) { MarsMission::RoverCommander.new(rover: rover ) }

    describe '#run' do
      context "sending messages" do
        it 'sends move message to rover' do
          expect(rover).to receive(:move).exactly(5).times
          commander.run(instructions: instructions)
        end

        it 'sends turn direction message to rover' do
          expect(rover).to receive(:turn).exactly(4).times
          commander.run(instructions: instructions)
        end
      end

      context "rover destination"  do
        it "should be at position 1 3" do
          commander.run(instructions: instructions)
          expect(commander.rover_location).to match_array([1, 3])
        end

        it "should be facing North" do
          commander.run(instructions: instructions)
          expect(commander.rover_direction).to eq "N"
        end
      end
    end
  end

  context "rover at position 3 3 E" do
    let (:instructions) { 'MMRMMRMRRM' }
    let (:rover) { MarsMission::Rover.new(location: [3, 3], direction: 'E') }
    let (:commander) { MarsMission::RoverCommander.new(rover: rover ) }

    describe '#run' do
      context "sending messages" do
        it 'sends move message to rover' do
          expect(rover).to receive(:move).exactly(6).times
          commander.run(instructions: instructions)
        end

        it 'sends turn direction message to rover' do
          expect(rover).to receive(:turn).exactly(4).times
          commander.run(instructions: instructions)
        end
      end

      context "rover destination"  do
        it "should be at position 5 1" do
          commander.run(instructions: instructions)
          expect(commander.rover_location).to match_array([5, 1])
        end

        it "should be facing North" do
          commander.run(instructions: instructions)
          expect(commander.rover_direction).to eq "E"
        end
      end
    end
  end

  context "Invalid instructions" do
    let (:instructions) { 'XXXX' }
    let (:rover) { MarsMission::Rover.new(location: [3, 3], direction: 'E') }
    let (:commander) { MarsMission::RoverCommander.new(rover: rover ) }

    it "should raise error" do
      expect { commander.run(instructions: instructions) }.to raise_error(MarsMission::RoverCommander::InvalidInstructionError)
    end
  end
end
