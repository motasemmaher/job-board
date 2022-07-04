class HealthsController < ApplicationController
  def check
    render status: :ok, json: { status: :ok, statusCode: 200 }.to_json
  end
end
