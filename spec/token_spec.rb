require 'securerandom'

RSpec.describe Struby do
  context '.token' do
    it 'return api token' do
      token = SecureRandom.hex(16)
      expect(token).to eq Struby.token(token)
    end
  end
end
