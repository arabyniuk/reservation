require 'rails_helper'

describe Reservation do
  it "has a valid factory" do
    expect(build(:reservation)).to be_valid
  end
  it "is invalid without a end_time" do
    expect(build(:reservation, end_time: nil)).to be_invalid
  end
  it "is invalid if end_time less then start_time" do
    expect(build(:reservation, end_time: Time.now - 8.hours)).to be_invalid
  end

  describe "time ranges" do
    before :each do
      create(:reservation)
    end
    context "valid if" do
      it "A occurs entirely B after" do
        expect(build(:reservation, start_time: Time.now + 8.hours, end_time: Time.now + 10.hours, table_id: 1)).to be_valid
      end
      it "B occurs entirely after A" do
        expect(build(:reservation, start_time: Time.now - 10.hours, end_time: Time.now - 8.hours, table_id: 1)).to be_valid
      end
    end
    context "invalid if" do
      it "A surrounds B" do
        expect(build(:reservation, start_time: Time.now - 5.hours, end_time: Time.now + 5.hours, table_id: 1)).to be_invalid
      end
      it "B surrounds A" do
        expect(build(:reservation, start_time: Time.now + 1.hours, end_time: Time.now + 2.hours, table_id: 1)).to be_invalid
      end
      it "A partially overlaps B" do
        expect(build(:reservation, start_time: Time.now - 2.hours, end_time: Time.now + 2.hours, table_id: 1)).to be_invalid
      end
      it "A partially overlaps B after" do
        expect(build(:reservation, start_time: Time.now + 2.hours, end_time: Time.now + 8.hours, table_id: 1)).to be_invalid
      end
    end
    context "valid with different association" do
      it "A partially overlaps B after" do
        expect(build(:reservation, start_time: Time.now + 2.hours, end_time: Time.now + 8.hours)).to be_valid
      end
    end
  end
end
