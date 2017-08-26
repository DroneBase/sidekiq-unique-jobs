# frozen_string_literal: true

class MyUniqueJob
  include Sidekiq::Worker
  sidekiq_options(
    queue: :customqueue,
    retry: true,
    unique: :until_executed,
    lock_expiration: 7_200,
    retry_count: 10,
  )
  def perform(_one, _two); end
end
