require "rails_helper"

RSpec.describe "stories/new", type: :view do
  before(:each) do
    assign(:story, Story.new(
                     title: "MyString",
                     content: "MyText"
                   ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do
      assert_select "input[name=?]", "story[title]"

      assert_select "textarea[name=?]", "story[content]"
    end
  end
end
