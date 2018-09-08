RSpec.describe Bike do
  context '#new' do
    it 'return bike instance' do
      params = { distance: 100.0, id: 'bike1', name: 'Tarmac', primary: true, resource_state: 2 }
      bike = Struby::Bike.new(params)
      expect(bike.id).to eq params[:id]
      expect(bike.distance).to eq params[:distance]
      expect(bike.name).to eq params[:name]
      expect(bike.primary).to eq params[:primary]
      expect(bike.resource_state).to eq params[:resource_state]
    end

    it 'return bike when designation by id' do
      gear_id = 'b4633214'
      VCR.use_cassette('fetch_bike') do
        bike = Struby::Bike.new(gear_id)
        expect(bike.id).to eq gear_id
        expect(bike.name).to eq 'SWORKS Tarmac SL6 Arc-en-Ciel'
      end
    end

    it 'raises when args is not Hash or String' do
      expect { Struby::Bike.new(1) }.to raise_error(ArgumentError)
    end

    it 'raises when wrong gear_id' do
      VCR.use_cassette('wrong_gear_id') do
        wrong_gear_id = '------'
        expect { Struby::Bike.new(wrong_gear_id) }.to raise_error(Strava::Api::V3::ClientError)
      end
    end
  end
end
