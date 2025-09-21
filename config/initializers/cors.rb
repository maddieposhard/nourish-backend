config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://nourish-frontend-wheat.vercel.app'  # be explicit in production
    
    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      credentials: true
  end
end
