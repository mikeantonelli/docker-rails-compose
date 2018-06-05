require 'spec_helper'

describe 'true' do
  it 'is true' do
    expect(true).to be(true)
  end
end

describe 'false' do
  it 'is false' do
    expect(false).to be(false)
  end
end
