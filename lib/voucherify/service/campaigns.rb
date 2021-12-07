require 'uri'

module Voucherify
  module Service
    class Campaigns
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def create(campaign)
        @client.post('/campaigns', campaign.to_json)
      end

      def get(campaign_name)
        @client.get("/campaigns/#{ERB::Util.url_encode(campaign_name)}")
      end

      def delete(campaign_name, params = {})
        @client.delete("/campaigns/#{ERB::Util.url_encode(campaign_name)}", {:force => (!!(params['force'] || params[:force])).to_s})
        nil
      end

      def add_voucher(campaign_name, params = {})
        code = params['code'] || params[:code]
        url = "/campaigns/#{ERB::Util.url_encode(campaign_name)}/vouchers"
        url += "/#{ERB::Util.url_encode(code)}" if code
        params.delete 'code'
        params.delete :code
        @client.post(url, params.to_json)
      end

      def import_vouchers(campaign_name, vouchers)
        @client.post("/campaigns/#{ERB::Util.url_encode(campaign_name)}/import", vouchers.to_json)
      end

      def qualification(params = {})
        audienceRulesOnly = params['audienceRulesOnly'] || params[:audienceRulesOnly]
        limit = params['limit'] || params[:limit]
        order = params['order'] || params[:order]
        params.delete 'audienceRulesOnly'
        params.delete :audienceRulesOnly
        params.delete 'limit'
        params.delete :limit
        params.delete 'order'
        params.delete :order
        url   = "/campaigns/qualification?audienceRulesOnly=#{!!audienceRulesOnly}&order=#{ERB::Util.url_encode(order)}&limit=#{ERB::Util.url_encode(limit)}"
        @client.post(url, params.to_json)
      end
    end
  end
end