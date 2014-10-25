actions :set

attribute :key, :kind_of => String, :required => true
attribute :name, :kind_of => String, :name_attribute => true, :required => true
attribute :path, :kind_of => String
attribute :schema, :kind_of => String, :required => true
attribute :user, :kind_of => String, :required => true
attribute(:value, {
  :kind_of => [
    Array,
    FalseClass,
    Float,
    Integer,
    String,
    TrueClass,
  ],
  :required => true
})
