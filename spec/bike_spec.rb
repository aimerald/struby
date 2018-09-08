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
  end
end
