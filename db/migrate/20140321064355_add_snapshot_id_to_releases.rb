class AddSnapshotIdToReleases < ActiveRecord::Migration
  def change
    add_reference :releases, :snapshot, index: true
  end
end
