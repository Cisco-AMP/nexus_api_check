RSpec.shared_context 'setup Nexus API' do
  let(:api) do
    NexusAPI::API.new(
      username: ENV['NEXUS_USERNAME'],
      password: ENV['NEXUS_PASSWORD'],
      hostname: ENV['NEXUS_HOSTNAME'],
    )
  end
end