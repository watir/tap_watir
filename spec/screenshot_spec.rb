require 'base64'
require 'spec_helper'

RSpec.describe TapWatir::Screenshot do
  let(:png_header) { "\211PNG".force_encoding('ASCII-8BIT') }

  describe '#png' do
    it 'gets png representation of screenshot' do
      expect($app.screenshot.png[0..3]).to eq png_header
    end
  end

  describe '#base64' do
    it 'gets base64 representation of screenshot' do
      image = $app.screenshot.base64
      expect(Base64.decode64(image)[0..3]).to eq png_header
    end
  end

  describe '#save' do
    it 'saves screenshot to given file' do
      path = "#{Dir.tmpdir}/test#{Time.now.to_i}.png"
      expect(File).to_not exist(path)
      $app.screenshot.save(path)
      expect(File).to exist(path)
      expect(File.open(path, 'rb', &:read)[0..3]).to eq png_header
    end
  end
end
