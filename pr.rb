require 'sinatra'
require 'page_rankr'

get '/*' do
  url = params[:splat].join('/')
  begin
    sleep 1+rand*2 #just to play safe, 1 to 3 sec
    pr = PageRankr.ranks(url, :google)
    rank = pr[:google]
    rank = 0 if rank.nil?
  rescue
    rank = 0
  end
  "#{rank}"
end
