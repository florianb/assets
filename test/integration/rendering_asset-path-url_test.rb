require 'test_helper'


describe 'asset_path' do
  before(:each) do
    Lotus::Assets.configuration.reset!
  end

  after(:each) do
    Lotus::Assets.configuration.reset!
    Thread.current[:__lotus_assets] = nil
  end

  it 'generates a relative asset-path' do
    @result = AssetPathHelper.new.render

    @result.must_match '/assets/logo.png'
  end

  it 'generates a prefixed relative asset-path' do
    Lotus::Assets.configure do
      prefix '/admin-prefix'
    end
    @result = AssetPathHelper.new.render

    @result.must_match "/assets/admin-prefix/logo.png"
  end

end


describe 'asset_url' do
  before(:each) do
    Lotus::Assets.configuration.reset!
  end

  after(:each) do
    Lotus::Assets.configuration.reset!
    Thread.current[:__lotus_assets] = nil
  end

  it 'generates an absolute asset-url' do
    @result = AssetUrlHelper.new.render

    @result.must_match 'https://lotusrb.org/assets/logo.png'
  end

  it 'generates a prefixed absolute asset-url' do
    Lotus::Assets.configure do
      prefix '/prefixed'
    end
    @result = AssetUrlHelper.new.render

    @result.must_match "https://lotusrb.org/assets/prefixed/logo.png"
  end

  it 'generates an absolute asset-url considering a custom scheme' do
    @result = AssetUrlHelper.new.render

    @result.must_match "test-scheme://lotusrb.org/assets/logo.png"
  end

  it 'generates an absolute asset-url considering a custom domain' do
    @result = AssetUrlHelper.new.render

    @result.must_match "https://this.is-a.domain-to.test/assets/logo.png"
  end

  it 'generates an absolute asset-url considering a custom port' do
    @result = AssetUrlHelper.new.render

    @result.must_match "https://lotusrb.org:test-port/assets/logo.png"
  end

  it 'generates an absolute asset-url considering custom URL-parameters' do
    @result = AssetUrlHelper.new.render

    @result.must_match "file://files.lotus-master.com:8080/assets/logo.png"
  end
end
