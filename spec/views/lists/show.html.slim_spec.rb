require 'rails_helper'

RSpec.describe "lists/show", :type => :view do
  before(:each) do
    @list = assign(:list, List.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
