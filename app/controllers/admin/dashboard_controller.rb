class Admin::DashboardController < Admin::ApplicationController

    def index
        @stories = Story.all.order(id: :desc).where(published: false).limit(5)
        @news = NewsItem.all.order(id: :desc).limit(5)
        @histories = History.all.order(id: :desc).limit(5)
        authorize @stories
    end

end
