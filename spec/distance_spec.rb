RSpec.describe Distance do
  context '#new' do
    it 'return default kill meter' do
      num = 100
      distance = Struby::Distance.new(num)
      expect(distance.class).to eq Struby::Distance
    end
  end

  context 'return to_km' do
    num = 30
    distance = Struby::Distance.new(num)
    expect(distance.to_km).to eq num
    expect(distance.to_km(:m)).to
  end
end
