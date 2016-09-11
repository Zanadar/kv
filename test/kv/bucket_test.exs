defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3

    KV.Bucket.put(bucket, "eggs", 6)
    eggs = KV.Bucket.delete(bucket, "eggs")
    assert eggs == 6
    assert KV.Bucket.get(bucket, "eggs") == nil
  end
end
