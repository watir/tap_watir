require 'spec_helper'

RSpec.describe TapWatir::Element do
  describe '#wait_until' do
    it 'returns element for additional actions' do
      element = $app.element(accessibility_id: 'Welcome to Address Book')
      expect(element.wait_until(&:exists?)).to eq element
    end
  end

  describe '#wait_while' do
    it 'returns element for additional actions' do
      element = $app.element(id: 'android:id/statusBarBackground')
      expect(element.wait_while(&:exists?)).to eq element
    end
  end
end
