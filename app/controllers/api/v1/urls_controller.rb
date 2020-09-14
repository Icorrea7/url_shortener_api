class Api::V1::UrlsController < ApplicationController
    def index
        @urls = Url.all
        render json: @urls
      end

      def create
        @url = Url.new(url_params)
        @url.base_url = request.base_url
        if @url.save
            json: {"success": true, "original": @url.long_url, "short": @url.complete_short}
        else
            json = {"success": false, "original": @url.long_url}
        end
      end
      def show
        @url = Url.find_by(short: params[:short])
        redirect_to @url.long_url
      end
      private
      def url_params
        params.permit(:long_url, :short)
      end
end
