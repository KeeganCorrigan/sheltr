require "rails_helper"

describe 'get /api/v1/admin/dashboard' do
  it "can get a list of comments that are not approved" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    create_list(:comment, 3)
    create(:comment, approved: true)

    get "/api/v1/dashboard"

    comments = JSON.parse(response.body, symbolize_names: true)
    comment = comments.first

    expect(comments.count).to eq(3)
    expect(comment).to have_key(:id)
    expect(comment).to have_key(:place_id)
    expect(comment).to have_key(:body)
    expect(comment).to have_key(:approved)
    expect(comment).to have_key(:created_at)
    expect(comment).to have_key(:updated_at)
  end
end
