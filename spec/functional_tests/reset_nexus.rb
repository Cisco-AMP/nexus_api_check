RSpec.shared_context 'reset Nexus state' do
  context 'cleans up prior test artifacts' do
    it 'by deleting locally downloaded files' do
      File.delete(filename) if File.file?(filename)
    end

    it 'by deleting the test tag' do
      api.delete_tag(name: tag) if tag_exists?
    end

    it 'by deleting the repository if it exists' do
      api.delete_repository(name: repository) if repo_in_nexus?(repository)
    end
  end
end
