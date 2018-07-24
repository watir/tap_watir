require 'spec_helper'

RSpec.describe TapWatir::Element do
  describe '#wd' do
    it 'stores underlying Selenium Element' do
      element = $app.element(id: "android:id/content")
      expect(element.wd).to be_a(Selenium::WebDriver::Element)
    end
  end

  describe '#new' do
    it 'does not locate element during initialization' do
      expect($app.driver).not_to receive :find_element
      $app.element(id: "android:id/content")
    end
  end
end