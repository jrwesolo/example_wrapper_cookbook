require 'spec_helper'

describe 'example_wrapper_cookbook::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should create a file1.txt' do
    expect(chef_run).to create_file('/tmp/file1.txt')
  end

  it 'should create a file2.txt' do
    expect(chef_run).to create_file('/tmp/file2.txt')
  end

  it 'should include example_cookbook::default' do
    expect(chef_run).to include_recipe('example_cookbook::default')
  end
end
