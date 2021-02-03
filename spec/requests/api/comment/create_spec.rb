RSpec.describe 'POST /api/articles/:article_id/comments', type: :request do
  let!(:article) { create(:article) }
  let(:user) { create(:user)}
  let(:user_headers) { user.create_new_auth_token}

  describe 'successfully' do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: {
            body: 'This is the first comment!',
            article_id: article.id
          }
        },
        headers: user_headers
    end
    it 'is expected to return a 201 response' do
      expect(response).to have_http_status 201
    end

    it "is expected to return a success message" do
      expect(response_json['message']).to eq 'Your comment was created successfully!'
    end
  end

  describe "unsuccessfully" do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: {
            article_id: article.id
          }
        },
        headers: user_headers
    end

    it "is expected to return a 422 response" do
      expect(response).to have_http_status 422 
    end
    
    it "is expected to return an error message" do
      expect(response_json['message']).to eq "Body can't be blank"
    end
  end
end