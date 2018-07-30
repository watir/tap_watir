# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TapWatir::Element do
  it 'stores instance variable for driver' do
    element = $app.element(id: 'foo')
    expect(element.instance_variable_get('@wd')).to eq $app.driver
  end

  it 'stores instance variable for selector' do
    selector = {id: 'foo'}
    element = $app.element selector
    expect(element.instance_variable_get('@selector')).to eq selector
  end
end
