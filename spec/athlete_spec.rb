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
    it 'return athlete using params' do
      params = {
        'id' => 19_600_913,
        'username' => 'aimerald',
        'resource_state' => 3,
        'firstname' => 'UG',
        'lastname' => 'Muscle',
        'city' => '北区',
        'state' => '大阪市',
        'country' => '日本',
        'sex' => 'M',
        'premium' => true,
        'summit' => true,
        'created_at' => '2017-01-27T06:52:56Z',
        'updated_at' => '2018-09-06T15:11:16Z',
        'badge_type_id' => 1,
        'profile_medium' => 'https://dgalywyr863hv.cloudfront.net/pictures/athletes/19600913/5686228/6/medium.jpg',
        'profile' => 'https://dgalywyr863hv.cloudfront.net/pictures/athletes/19600913/5686228/6/large.jpg',
        'friend' => nil,
        'follower' => nil,
        'email' => 'aimerald3@gmail.com',
        'follower_count' => 23,
        'friend_count' => 51,
        'mutual_friend_count' => 0,
        'athlete_type' => 0,
        'date_preference' => '%m/%d/%Y',
        'measurement_preference' => 'meters',
        'clubs' => [],
        'ftp' => 198,
        'weight' => 56.5,
        'bikes' => [],
        'shoes' => []
      }
      athlete = Struby::Athlete.new(params)
      params.each do |k, v|
        expect(athlete.send(k.to_sym)).to eq v
      end
    end

    it 'return athlete instance' do
      expect(@athlete.class).to eq Struby::Athlete
    end

    it 'raise error when argment is invalid' do
      expect { Struby::Athlete.new(1) }.to raise_error(ArgumentError)
      expect { Struby::Athlete.new([]) }.to raise_error(ArgumentError)
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

  context '#activites' do
    it 'returns activity' do
      VCR.use_cassette('fetch_activities') do
        activities = @athlete.activities
        expect(activities.count).to eq 200
        activities.each do |activity|
          expect(activity.class).to eq Struby::Activity
        end
      end
    end
  end

  it 'test' do
    VCR.use_cassette('fetch_activities') do
      activities = @athlete.activities
      activities.growth_by_power
    end
  end
end
