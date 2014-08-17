require 'rails_helper'

RSpec.describe "items/show", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "Title",
      :url => "Url",
      :list_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/1/)
  end
end
