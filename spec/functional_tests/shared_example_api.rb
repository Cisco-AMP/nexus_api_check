require 'digest'
require 'functional_tests/helper_methods'
require 'functional_tests/reset_nexus'

include HelperMethods

RSpec.shared_examples 'a Nexus API and' do
  include_context 'reset Nexus state'

  context 'can create' do
    it 'a new repo' do
      expect(repo_in_nexus?(repository)).to be_falsey
      expect(create_repository).to be(true)
      expect(repo_in_nexus?(repository)).to be_truthy
    end
  end

  context 'can create a tag' do
    it 'that does not exist' do
      expect(tag_exists?).to be(false)
      expect(api.create_tag(name: tag)).to be(true)
      expect(tag_exists?).to be(true)
    end
  end

  context 'can upload a component' do
    it 'to a repository' do
      expect(find_asset.empty?).to be(true)
      expect(upload).to be(true)
      asset_in_nexus?
    end

    it 'with a tag' do
      components = api.list_components(repository: repository)
      components.each do |component|
        expect(component['tags'].first).to eq(tag)
      end
    end
  end
  
  context 'can download a component' do
    it 'from a repository' do
      expect(File.file?(filename)).to be(false)
      expect(api.download(id: asset_id, name: filename)).to be(true)
      expect(File.file?(filename)).to be(true)
    end

    it 'and has the correct SHA1' do
      expect(File.file?(filename)).to be(true)
      expect(Digest::SHA1.file(filename)).to eq(sha1)
    end

    it 'that has the correct filesize' do
      expect(File.file?(filename)).to be(true)
      expect(File.size(filename)).to eq(filesize)
    end
  end

  context 'can delete a component' do
    it 'locally' do
      expect(File.file?(filename)).to be(true)
      expect(File.delete(filename)).to eq(1)
      expect(File.file?(filename)).to be(false)
    end
  end

  context 'can delete a tag' do
    it 'from Nexus' do
      expect(tag_exists?).to be(true)
      expect(api.delete_tag(name: tag)).to be(true)
      expect(tag_exists?).to be(false)
    end
  end

  context 'can delete' do
    it 'an existing repo' do
      expect(repo_in_nexus?(repository)).to be_truthy
      expect(api.delete_repository(name: repository)).to be(true)
      expect(repo_in_nexus?(repository)).to be_falsey
    end
  end
end
