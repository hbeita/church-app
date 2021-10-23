# frozen_string_literal: true

json.extract! pray, :id, :checked, :submitted_by, :pray, :created_at, :updated_at
json.url pray_url(pray, format: :json)
