class EventsController < ApiController
	require 'bcrypt'

	def index
		puts session[:cart1]
		puts 'qqqq'
		@events=Event.all
		respond_to do |format|
			format.json {render json:@events}
			format.html {render :index}
		end
	end

	def create
		@event=Event.new({name:params['name'],context:params['context']\
		,event_status:params['event_status']})
		@event.save
		redirect_to :action => :index
	end

	def show
		@event=Event.find(params[:id])
		if(@event.event_status=='update')
			@event.event_status='版本更新'
		else
			@event.event_status='最新消息'
		end
		respond_to do |format|
			format.json {render json:@event}
			format.html {render :show}
		end
	end
	
	def update
		@event=Event.find(params[:id])
		@event.name=params['name']
		@event.context=params['context']
		@event.event_status=params['event_status']
		@event.save
		redirect_to :action => :index
	end

	def destroy
		@event=Event.find(params[:id])
		@event.destroy
		redirect_to :action => :index
	end

	def del_all
		@e=Event.all
		@e.delete_all
		redirect_to :action => :index
	end
end
