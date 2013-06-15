require 'sinatra'
require 'page_rankr'

get '/*' do
  url = params[:splat].join('/')
  begin
    sleep 0.1+rand
    pr = PageRankr.ranks(url, :google)
    rank = pr[:google]
    rank = 0 if rank.nil?
  rescue
    rank = 0
  end
  "#{rank}"
end
