require 'rails_helper'

describe 'Article API', type: :request do
    describe 'GET /articles' do
        before do
            FactoryBot.create(:article, author: 'James Bond', title: 'Daniel in the lion/s Den', body: 'He had faithfully served the Lord with all his heard and soul')
            FactoryBot.create(:article, author: 'Cramer Phillipe', title: 'A men does not have to have all', body: 'He had faithfully served the Lord with all his heard and soul')
        end
        
        it 'returns all articles' do
            get '/api/v1/articles'
    
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe 'POST /articles' do
        it 'create a new article' do
            expect {
                post '/api/v1/articles', params: { article: {author: 'Jason Derulo', title: 'One of the greatest dancers', body: 'Dacing is awesome. It is an honor for me to dance today'} }
            }.to change { Article.count }.from(0).to(1)
           
            expect(response).to have_http_status(:created)
        end
    end

    describe 'Delete /articles/:id' do
        let!(:article) { FactoryBot.create(:article, author: 'Cramer Phillipe', title: 'A men does not have to have all', body: 'He had faithfully served the Lord with all his heard and soul') }
        
        it 'Deletes a new article' do
            expect {
                delete "/api/v1/articles/#{article.id}"
            }.to change { Article.count }.from(1).to(0)

            expect(response).to have_http_status(:no_content)
        end
    end
   
end