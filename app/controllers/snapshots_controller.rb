class SnapshotsController < ApplicationController
  before_action :set_snapshot, only: [:show]

  def index
    @snapshots = Snapshot.last(20).reverse
    @latest_snapshot = @snapshots.last

    @web_snapshots = WebWalletCount.last(20).reverse
    @latest_web_snapshot = @web_snapshots.last
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_snapshot
    @snapshot = Snapshot.find(params[:id])
  end
end
