module HelperMethods
  def nexus_contains?(method, name)
    api.send(method).select { |script| script['name'] == name }.empty? ? false : true
  end

  def script_in_nexus?(name)
    nexus_contains?(:list_scripts, name)
  end

  def repo_in_nexus?(name)
    nexus_contains?(:list_repositories, name)
  end

  def upload_script(name)
    expect(script_in_nexus?(name)).to be_falsey
    expect(api.upload_script(filename: File.join(SCRIPTS_LOCATION, name + '.json'))).to be(true)
    expect(script_in_nexus?(name)).to be_truthy
  end

  def delete_script(name)
    expect(script_in_nexus?(name)).to be_truthy
    expect(api.delete_script(name: name)).to be(true)
    expect(script_in_nexus?(name)).to be_falsey
  end

  def asset_id
    list = find_asset
    expect(list.length).to eq(1)
    list.first['id']
  end

  def asset_in_nexus?
    count = 5
    number_of_assets = 0
    while count.positive?
      count -= 1
      number_of_assets = find_asset.length
      break if number_of_assets.positive?
    end
    expect(number_of_assets).to eq(1)
  end

  def tag_exists?
    result = api.list_tags.select { |tag_entry| tag_entry['name'] == tag }
    result.any?
  end
end
