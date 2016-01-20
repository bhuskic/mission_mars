require 'spec_helper'

RSpec.describe MarsMission::Rover do
  let (:location) { [2, 2] }

  subject (:rover) { MarsMission::Rover.new(location: location, direction: 'N') }

  describe "#initialize" do
    it 'should have location' do
      expect(rover.direction).not_to be_nil
    end

    it 'should have direction' do
      expect(rover.direction).not_to be_nil
    end
  end

  describe '#move' do
    context 'without direction change' do
      context "move one cell" do
        it "should go up one cell" do
          rover.move
          expect(rover.location).to match_array([2, 3])
        end
      end

      context 'move two cells' do
        it 'should go up two cells' do
          2.times { rover.move }
          expect(rover.location).to match_array([2, 4])
       end
      end
    end

    context 'with direction change' do
      context 'one left turn' do
        it 'should move one cell left' do
          rover.turn(direction: 'L')
          rover.move
          expect(rover.location).to match_array([1, 2])
        end
      end

      context 'two left turns' do
        it 'should move one cell down' do
          2.times { rover.turn(direction: 'L') }
          rover.move
          expect(rover.location).to match_array([2, 1])
        end
      end

      context 'three left turns' do
        it 'should move one cell right' do
          3.times { rover.turn(direction: 'L') }
          rover.move
          expect(rover.location).to match_array([3, 2])
        end
      end

      context 'one right turn' do
        it 'should move one cell right' do
          rover.turn(direction: 'R')
          rover.move
          expect(rover.location).to match_array([2, 3])
        end
      end

      context 'two right turns' do
        it 'should move one cell down' do
          2.times { rover.turn(direction: 'R') }
          rover.move
          expect(rover.location).to match_array([1, 2])
        end
      end

      context 'three right turns' do
        it 'should move one cell left' do
          3.times { rover.turn(direction: 'R') }
          rover.move
          expect(rover.location).to match_array([2, 1])
        end
      end
    end
  end

  context 'turn' do
    context 'left' do
      it 'should be facing West' do
        rover.turn(direction: 'L')
        expect(rover.direction).to eq 'W'
      end
    end

    context 'two times lefts' do
      it "should be facin South" do
        2.times { rover.turn(direction: 'L') }
        expect(rover.direction).to eq 'S'
      end
    end

    context 'three times lefts' do
      it "should be facin East" do
        3.times { rover.turn(direction: 'L') }
        expect(rover.direction).to eq 'E'
      end
    end

    context 'right' do
      it "should be facing East" do
        rover.turn(direction: 'R')
        expect(rover.direction).to eq 'E'
      end
    end

    context 'two times right' do
      it "should be facin South" do
        2.times { rover.turn(direction: 'R') }
        expect(rover.direction).to eq 'S'
      end
    end

    context 'three times right' do
      it "should be facin West" do
        3.times { rover.turn(direction: 'R') }
        expect(rover.direction).to eq 'W'
      end
    end
  end
end
