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

  describe '#exist?' do
    it 'checks if the element exists' do
      expect($app.element(id: 'com.address.book:id/progressBar')).to exist
    end

    it 'checks if the element does not exists' do
      expect($app.element(id: 'NotAnElement')).not_to exist
    end

    it 'exists if previously located' do
      element = $app.element(id: 'android:id/statusBarBackground')
      element.wd
      expect(element).to exist
    end
  end

  describe '#present?' do
    it 'checks if the element is present' do
      expect($app.element(id: 'com.address.book:id/progressBar')).to be_present
    end

    it 'checks if the element is not present' do
      expect($app.element(id: 'NotAnElement')).not_to be_present
    end
  end

  describe '#visible?' do
    it 'checks if the element is visible' do
      expect($app.element(id: 'com.address.book:id/progressBar')).to be_visible
    end

    it 'checks if the element is not visible' do
      expect($app.element(id: 'NotAnElement')).not_to be_visible
    end
  end
end
