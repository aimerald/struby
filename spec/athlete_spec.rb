RSpec.describe Athlete do
  before do
    @athlete_methods = %i[
      id username resource_state firstname lastname city state country
      sex premium summit created_at updated_at badge_type_id profile_medium
      profile friend follower email follower_count friend_count
      mutual_friend_count athlete_type date_preference measurement_preference
      clubs ftp weight bikes shoes
    ]
    VCR.use_cassette('fetch_athlete') do
      @athlete = Struby::Athlete.new
    end
  end

  context '#new' do
    it 'return athlete instance' do
      expect(@athlete.class).to eq Struby::Athlete
    end
  end

  context '#methods' do
    it 'has methods?' do
      @athlete_methods.each do |method|
        expect(@athlete.methods).to include method
      end
    end
  end

  context '#bikes' do
    it 'return Struby::Bike instances' do
      @athlete.bikes.each do |bike|
        expect(bike.class).to eq Struby::Bike
      end
    end
  end

  context '#clubs' do
    it 'return Struby::Club instances' do
      @athlete.clubs.each do |club|
        expect(club.class).to eq Struby::Club
      end
    end
  end

  context '#power_weight_ratio' do
    it 'return pwr' do
      allow_any_instance_of(Struby::Athlete).to receive(:weight).and_return(55)
      allow_any_instance_of(Struby::Athlete).to receive(:ftp).and_return(357.5)
      expect(@athlete.power_weight_ratio).to eq 6.5
    end
  end
end
