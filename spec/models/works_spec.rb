require 'rails_helper'

describe Work do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:work)).to be_valid
  end

  it 'validates title and image_file_name columns' do
    work = FactoryGirl.create(:work)
    expect(work.title).to_not be_nil
    expect(work.title).to eq('Mona Lisa')
    expect(work.image_file_name).to_not be_nil
    expect(work.image_file_name).to eq('images/image.jpg')
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:work, title: '')).to_not be_valid
  end

  it 'is invalid without image_file_name' do
    expect(FactoryGirl.build(:work, image_file_name: '')).to_not be_valid
  end

end