require 'rails_helper'

RSpec.describe Trip, type: :model do

  context "instance methods" do
      before(:each) do
        @user = User.create!(name: 'Bradley', email: 'yes@yes.com', about: 'He is pretty cool')
        @trip = Trip.create!(name: 'Hawaii', total_miles: 5000, user_id: @user.id)
        @trip2 = Trip.create!(name: 'Provo', total_miles: 50)
      end

      describe "#really_far?" do
        it "Trip is really far" do
          expect(@trip.really_far?).to eq(true)
        end

        it "Trip is not far" do
          expect(@trip2.really_far?).to eq(false)
        end
      end

      describe "#print_user" do
        it "prints user name" do
          expect(@trip.user.name).to eq('Bradley')
        end
      end

  end

  context "class methods" do
    before(:each) do
      @trip = Trip.create!(name: 'Hawaii', total_miles: 5000)
      @trip2 = Trip.create!(name: 'Provo', total_miles: 50)
    end

    describe "#by_total_miles" do
      it "sorts be miles" do
        expect(Trip.all.by_total_miles.first).to eq(@trip)
      end
    end
  end
end
