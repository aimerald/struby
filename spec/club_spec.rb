RSpec.describe Club do
  context '#new' do
    it 'return club instance' do
      params = {
        'id' => 1,
        'resource_state' => 2,
        'name' => 'I am Specialized',
        'profile_medium' => 'https://dgalywyr863hv.cloudfront.net/pictures/clubs/26315/629760/1/medium.jpg',
        'profile' => 'https://dgalywyr863hv.cloudfront.net/pictures/clubs/26315/629760/1/large.jpg',
        'cover_photo' => nil,
        'cover_photo_small' => nil,
        'sport_type' => 'cycling',
        'city' => 'Киев',
        'state' => 'город Киев',
        'country' => 'Украина',
        'private' => false,
        'member_count' => 13_564,
        'featured' => false,
        'verified' => false,
        'url' => 'i-am-specialized',
        'membership' => 'member',
        'admin' => false,
        'owner' => false
      }
      club = Struby::Club.new(params)
      params.each do |key, value|
        expect(club.send(key.to_sym)).to eq value
      end
    end

    it 'return club when designation by id' do
      VCR.use_cassette('fetch_club') do
        club_id = '26315'
        club = Struby::Club.new(club_id)
        expect(club.id).to eq club_id.to_i
        expect(club.name).to eq 'I am Specialized'
      end
    end

    it 'rases when clud_id is not string or hash' do
      expect { Struby::Club.new(1) }.to raise_error(ArgumentError)
    end
  end
end
