require 'functional_tests/setup_api'
require 'functional_tests/shared_example_api'

TEST_ASSETS_LOCATION = File.join(File.dirname(__dir__), 'test_assets/').freeze

RSpec.describe NexusAPI do
  include_context 'setup Nexus API'

  describe 'with a maven repo' do
    it_behaves_like 'a Nexus API and' do
      let(:repository) { 'maven2-48dd4991-bc49-45ce-8014-e32b7d6bb7c4' }
      let(:filename) { 'maven2_f427c1139acd4d50bfa45ed0b3739617.jar' }
      let(:sha1) { '64c7dbd2429bd8c4d793b27a412c7348c8ee4ce2' }
      let(:filesize) { 930 }
      let(:tag) { '1ce9f7580c78470d95992a45bfb020e5' }

      def upload
        api.upload_maven_component(
          filename: File.join(TEST_ASSETS_LOCATION, filename),
          group_id: 'cbc697d8',
          version: 'ef9537f5',
          artifact_id: filename,
          repository: repository,
          tag: tag,
        )
      end

      def find_asset
        api.search_asset(
          name: filename,
          format: 'maven2',
          repository: repository,
          sha1: sha1,
        )
      end
    end
  end

  describe 'with a npm repo' do
    it_behaves_like 'a Nexus API and' do
      let(:repository) { 'npm-f8f8b45c-2d83-4f51-aca5-c847d6506783' }
      let(:filename) { 'npm_9e89d39f8b8146479b6295003a8ed903-1.0.0.tgz' }
      let(:sha1) { '2660ecf06c76cfa24e0e717184d0ca2f6ddba912' }
      let(:filesize) { 365 }
      let(:tag) { '5c828ef441fe44eb84309921a7b1f55b' }

      def upload
        api.upload_npm_component(
          filename: File.join(TEST_ASSETS_LOCATION, filename),
          repository: repository,
          tag: tag,
        )
      end

      def find_asset
        api.search_asset(
          name: filename,
          format: 'npm',
          repository: repository,
          sha1: sha1,
        )
      end
    end
  end

  describe 'with a pypi repo' do
    it_behaves_like 'a Nexus API and' do
      let(:repository) { 'pypi-bbc17c22-7a61-434c-80ff-6458b0527c22' }
      let(:filename) { 'pypi_e90cc4bdb4274b8d8a9b8786616da714-0.1-py2-none-any.whl' }
      let(:sha1) { '0043639dfa1538d07d4533c06e843fb4a723baff' }
      let(:filesize) { 1781 }
      let(:tag) { '51c15614bee4446f9f39113814df15b5' }

      def upload
        api.upload_pypi_component(
          filename: File.join(TEST_ASSETS_LOCATION, filename),
          repository: repository,
          tag: tag,
        )
      end

      def find_asset
        api.search_asset(
          name: filename,
          format: 'pypi',
          repository: repository,
          sha1: sha1,
        )
      end
    end
  end

  describe 'with a raw repo' do
    it_behaves_like 'a Nexus API and' do
      let(:repository) { 'raw-86ebf905-53c6-4ba4-a906-d21f631bc454' }
      let(:directory) { '3b25a887/a9d24a10/90a76739' }
      let(:filename) { 'raw_464d722f86724f0e82aea0e278a9a7b0.png' }
      let(:sha1) { 'eea84ca068ad7812cbd4262fb671b85b161453d4' }
      let(:filesize) { 41550 }
      let(:tag) { '5a8120fdda3e4e5d965bf07e57328323' }

      def upload
        api.upload_raw_component(
          filename: File.join(TEST_ASSETS_LOCATION, filename),
          directory: directory,
          repository: repository,
          tag: tag,
        )
      end

      def find_asset
        api.search_asset(
          name: filename,
          format: 'raw',
          repository: repository,
          sha1: sha1,
        )
      end
    end
  end

  describe 'with a rubygems repo' do
    it_behaves_like 'a Nexus API and' do
      let(:repository) { 'rubygems-c68c3075-aac2-4b32-a92e-94f2e3edc7c1' }
      let(:filename) { 'gem_20467c7b7e01442a93b3da3de703982f-0.1.0.gem' }
      let(:sha1) { '088cf3d009eba2c37a36f5affea1ab7b59d01fe2' }
      let(:filesize) { 6144 }
      let(:tag) { 'c89b3d46e3a645e1a9e48aba74707a51' }

      def upload
        api.upload_rubygems_component(
          filename: File.join(TEST_ASSETS_LOCATION, filename),
          repository: repository,
          tag: tag,
        )
      end

      def find_asset
        api.search_asset(
          name: filename,
          format: 'rubygems',
          repository: repository,
          sha1: sha1,
        )
      end
    end
  end

  describe 'with a yum repo' do
    it_behaves_like 'a Nexus API and' do
      let(:repository) { 'yum-ca34d968-3ffd-4342-bdb6-b343b5b519e6' }
      let(:directory) { '4f39a971/522544d0/1af828df' }
      let(:filename) { 'yum_cf5a52e7f1264f5aacc6e26e1331dcd9-1.0.0-1.el7.src.rpm' }
      let(:sha1) { '6cf29d8b427e2a904b2f581e1db267d7a8c7069f' }
      let(:filesize) { 1884 }
      let(:tag) { 'a2b2f26d0bb84a518074dfbafe9be04e' }

      def upload
        api.upload_yum_component(
          filename: File.join(TEST_ASSETS_LOCATION, filename),
          directory: directory,
          repository: repository,
          tag: tag,
        )
      end

      def find_asset
        api.search_asset(
          name: filename,
          format: 'yum',
          repository: repository,
          sha1: sha1,
        )
      end
    end
  end
end
