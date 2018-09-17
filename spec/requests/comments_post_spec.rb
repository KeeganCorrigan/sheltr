require "rails_helper"

describe 'post /api/v1/comments' do
  it "can create a comment" do
    comment_body = "oijasdoijoajsd"
    json_payload = {body: comment_body , place_id: 1112}

    post "/api/v1/comments", params: json_payload

    comment = Comment.last

    expect(Comment.count).to eq(1)
    expect(comment.body).to eq(comment_body)
    expect(comment.place_id).to eq("1112")
    expect(comment.approved?).to eq(false)
  end
end
