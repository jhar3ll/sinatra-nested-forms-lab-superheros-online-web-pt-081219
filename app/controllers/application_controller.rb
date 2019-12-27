require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    
    get '/' do 
      erb :super_heroes 
    end 
    
     post '/teams' do
   @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      members = params[:team][:members]
      
      @super_heroes = members.collect do |params|
        SuperHero.new({name: params[:name], power: params[:power], bio: params[:bio]})
    end

    erb :team
  end
end