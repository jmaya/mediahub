require 'rails_helper'

describe FileAttachment do

  subject { FactoryGirl.build(:file_attachment) }

  it 'should generate the sha1' do
    expect(subject.sha_1_hash).to eql(nil)
    subject.validate
    expect(subject.sha_1_hash).to eql('a8fdc205a9f19cc1c7507a60c4f01b13d11d7fd0')
  end

  it 'should not allow dups' do
    FactoryGirl.create(:file_attachment)

    expect(subject.save).to eql(false)

    
  end

end
