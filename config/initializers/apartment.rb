require "apartment/elevators/subdomain"

# A freshly created database can legitimately have no organizations yet.
ENV["IGNORE_EMPTY_TENANTS"] ||= "true"

Apartment.configure do |config|
  config.default_tenant = "public"
  config.excluded_models = %w[Organization]
  config.tenant_names = -> { Organization.pluck(:schema_name) }
end

Rails.application.config.middleware.use(Apartment::Elevators::Subdomain)
