module Callable
  def self.included(klass)
    klass.extend(self)
  end

  def call(...)
    new(...).call
  end

  def to_proc
    lambda do |args|
      call(args)
    end
  end
end