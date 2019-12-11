RSpec.shared_context 'reset Nexus state' do
  context 'cleans up prior test artifacts' do
    it 'by deleting locally downloaded files' do
      File.delete(filename) if File.file?(filename)
    end

    it 'by deleting the test tag' do
      api.delete_tag(name: tag) if tag_exists?
    end

    it 'by uploading a delete repository script' do
      if nexus_contains?(:list_repositories, repository)
        api.upload_script(filename: File.join(SCRIPTS_LOCATION, delete + '.json')) unless script_in_nexus?(delete)
      end
    end

    it 'by running a delete repository script' do
      api.run_script(name: delete) if nexus_contains?(:list_repositories, repository)
    end

    it 'by deleting all test scripts' do
      [create, delete].each do |script|
        api.delete_script(name: script) if script_in_nexus?(script)
      end
    end
  end
end
