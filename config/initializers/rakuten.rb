RakutenWebService.configure do |c|
    c.application_id = ENV["RAKUTEN_APPLICATION_ID"]
    # c.application_id = '1032687352420551313'
    c.affiliate_id = ENV["RAKUTEN_AFFILIATE_ID"] 
end
