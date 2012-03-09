require 'spec_helper'

describe 'main', :js => true do

  before (:each) { render }
  
  it 'should render the picker' do
    debugger
    rendered.should match /id="picker"/
  end
  
  it 'should render the picker' do
    rendered.should match /id="picker"/
  end

end
