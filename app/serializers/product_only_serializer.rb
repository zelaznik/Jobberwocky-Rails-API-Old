class ProductOnlySerializer < ProductSerializer
  def include_user?
    false
  end
end
