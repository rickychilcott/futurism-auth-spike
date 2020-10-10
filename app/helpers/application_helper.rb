module ApplicationHelper
  BASE_PERMISSION_SLEEP_VALUE = 1 # second

  # Fake permission check
  # Sleep for random to simulate database lookups
  def can?(permission, resource)
    Rails.cache.fetch(["permission", resource, permission], expires_in: 10.minutes) do
      sleep(BASE_PERMISSION_SLEEP_VALUE * rand)

      [true, false].sample
    end
  end

  def random_resource
    # Not the most efficient lookup, but it's the most reliable
    # and is thread/timing safe
    Resource.find(Resource.pluck(:id).sample)
  end
end
