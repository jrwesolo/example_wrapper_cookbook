require 'spec_helper'

describe port(9090) do
  it { should be_listening }
end
