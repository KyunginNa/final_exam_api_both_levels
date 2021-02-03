RSpec.describe 'POST /api/articles/:article_id/comments', type: :request do
  let!(:article) { create(:article) }
  let(:user) { create(:user)}
  let(:user_headers) { user.create_new_auth_token}

  describe 'successfully' do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: {
            body: 'This is the first comment!'
          }
        },
        headers: user_headers
    end
    it 'is expected to return a 201 response' do
      expect(response).to have_http_status 201
    end
  end
end