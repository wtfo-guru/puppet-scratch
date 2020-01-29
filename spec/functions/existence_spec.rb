require 'spec_helper'

describe 'scratch::existence' do
  it { is_expected.to run.with_params('/tmp/foo/bar.txt') }
end
