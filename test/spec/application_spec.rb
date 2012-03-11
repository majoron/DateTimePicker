require 'spec_helper'

describe 'application', :type => :request, :js => true do

  #include RSpec::Rails::ViewExampleGroup
    
  it 'simple' do
    visit '/1'
    sleep 100
    find('input[name="picker_1"]').click
  end

end
