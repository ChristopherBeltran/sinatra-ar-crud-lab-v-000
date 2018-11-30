
require_relative '../../config/environment'
require_relative '../models/article.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end
  
  
  get 'articles/new' do
    erb :'views/new'
  end 
  
  post '/articles' do
    @article = Article.new(params)
  end 
    
end 
#>>>>>>> 9c6464d9607186bb92210f4fcc4f928725d5ad16
