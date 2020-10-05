module ApplicationHelper
  # Fake permission check
  # Sleep for up to .2 seconds to simulate database lookups
  def can?(_permission, _resource)
    sleep 0.2 * rand

    [true, false].sample
  end

  def random_resource
    # Not the most efficient lookup, but it's the most reliable
    # and is thread/timing safe
    Resource.find(Resource.pluck(:id).sample)
  end
end
