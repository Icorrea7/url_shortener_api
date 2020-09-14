class Api::V1::UrlsController < ApplicationController
    def index
        @urls = Url.order(click_count: :desc)
        render json: @urls
      end

      def create
        @url = Url.new(url_params)
        @url.base_url = request.base_url
        if @url.save
            render json: {"success": true, "original": @url.long_url, "short": @url.complete_short}, status: 200
        else
            render json: {"success": false, "original": @url.long_url}, status: 400
        end
      end
      def show
        @url = Url.find_by(short: params[:short])
        if @url
            @url.update_attribute(:click_count, @url.click_count + 1)
            redirect_to @url.long_url
        else
            render json: {error: "not_found"}, status: 400 
        end
      end
      private
      def url_params
        params.permit(:long_url, :short)
      end
end
