require "rails_helper"

describe 'delete /api/v1/comments' do
  it "can delete a comment" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    comment = create(:comment)

    delete "/api/v1/comments/#{comment.id}"

    payload = JSON.parse(response.body, symbolize_names: true)

    expect(Comment.count).to eq(0)
    expect(payload[:message]).to eq("Comment deleted")
  end
end
