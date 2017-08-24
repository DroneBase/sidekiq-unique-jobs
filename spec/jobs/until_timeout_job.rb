# frozen_string_literal: true

class UntilTimeoutJob
  include Sidekiq::Worker
  sidekiq_options unique: :until_timeout, expiration: 10 * 60

  def perform(x)
    TestClass.run(x)
  end
end
