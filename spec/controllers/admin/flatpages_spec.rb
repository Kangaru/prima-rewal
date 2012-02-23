require 'spec_helper'

describe Admin::FlatpagesController do
  let(:user) { Factory :user }
  before { sign_in user }

  context "#sort" do
    it 'should change flatpages positions' do
      fp1, fp2 = Factory(:flatpage, position: 1), Factory(:flatpage, position: 2)

      put :sort, ids: [fp2.id, fp1.id]

      response.code.should == "200"

      Flatpage.find(fp2).position.should == 1
      Flatpage.find(fp1).position.should == 2
    end

    it 'should change flatpages positions in more complicated example' do
      fp1, fp2 = Factory(:flatpage, position: 1), Factory(:flatpage, position: 2)
      fp3, fp4 = Factory(:flatpage, position: 3), Factory(:flatpage, position: 4)

      put :sort, ids: [fp3.id, fp2.id, fp4.id, fp1.id]

      Flatpage.find(fp3).position.should == 1
      Flatpage.find(fp2).position.should == 2
      Flatpage.find(fp4).position.should == 3
      Flatpage.find(fp1).position.should == 4
    end
  end
end