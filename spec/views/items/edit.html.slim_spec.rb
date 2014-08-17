require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :url => "MyString",
      :list_id => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "input#item_url[name=?]", "item[url]"

      assert_select "input#item_list_id[name=?]", "item[list_id]"
    end
  end
end
