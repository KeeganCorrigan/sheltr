require "rails_helper"

describe 'post /api/v1/comments' do
  it "can create a comment" do
    comment_body = "oijasdoijoajsd"
    json_payload = {comment: comment_body , place_id: 1112}.to_json

    post "/api/v1/games", params: json_payload

    comment = Comment.last

    expect(Comment.count).to eq(1)
    expect(comment.body).to eq(comment_body)
    expect(comment.place_id).to eq(1112)
  end
end
