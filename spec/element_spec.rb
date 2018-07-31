# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TapWatir::Element do
  describe '#new' do
    it 'stores drivers as an instance vars' do
      element = $app.element(id: 'android:id/statusBarBackground')
      expect(element.instance_variable_get('@driver')).to eq $app.driver
    end

    it 'stores selector as an instance vars' do
      selector = {id: 'android:id/statusBarBackground'}
      element = $app.element(selector)
      expect(element.instance_variable_get('@selector')).to eq selector
    end

    it 'does not locate' do
      element = $app.element(id: 'android:id/statusBarBackground')
      expect(element.instance_variable_get('@element')).to be_nil
    end
  end

  describe '#wd' do
    it 'locates element if not fetched' do
      element = $app.element(id: 'android:id/statusBarBackground')
      expect(element.wd).to be_a Selenium::WebDriver::Element
    end
  end
end
