require 'functional_tests/setup_api'

RSpec.describe NexusAPI do
  include_context 'setup Nexus API'

  it 'can query Nexus status' do
    expect(api.status).to be(true)
  end

  it 'can query Nexus status_writable' do
    expect(api.status_writable).to be(true)
  end
end
