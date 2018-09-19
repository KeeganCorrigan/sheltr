require "rails_helper"

describe 'update /api/v1/comments' do
  it "can update a comment" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    comment = create(:comment)

    put "/api/v1/comments/#{comment.id}"

    payload = JSON.parse(response.body, symbolize_names: true)

    comment.reload
    expect(comment.approved).to eq(true)
    expect(payload[:message]).to eq("Comment approved")
  end

  it "can not update a comment if not an admin" do
    comment = create(:comment)

    put "/api/v1/comments/#{comment.id}"

    comment.reload
    expect(comment.approved).to eq(false)
  end
end
