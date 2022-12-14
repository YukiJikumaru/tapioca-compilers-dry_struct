# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `concurrent-ruby` gem.
# Please instead update this file by running `bin/tapioca gem concurrent-ruby`.

# {include:file:README.md}
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/constants.rb#1
module Concurrent
  extend ::Concurrent::Utility::EngineDetector
  extend ::Concurrent::Utility::NativeExtensionLoader
end

# A thread-safe subclass of Array. This version locks against the object
# itself for every method call, ensuring only one thread can be reading
# or writing at a time. This includes iteration methods like `#each`.
#
# @note `a += b` is **not** a **thread-safe** operation on
#   `Concurrent::Array`. It reads array `a`, then it creates new `Concurrent::Array`
#   which is concatenation of `a` and `b`, then it writes the concatenation to `a`.
#   The read and write are independent operations they do not form a single atomic
#   operation therefore when two `+=` operations are executed concurrently updates
#   may be lost. Use `#concat` instead.
# @see http://ruby-doc.org/core/Array.html Ruby standard library `Array`
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/array.rb#63
class Concurrent::Array < ::Array; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/array.rb#22
Concurrent::ArrayImplementation = Array

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#8
module Concurrent::Collection; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#11
Concurrent::Collection::MapImplementation = Concurrent::Collection::MriMapBackend

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#10
class Concurrent::Collection::MriMapBackend < ::Concurrent::Collection::NonConcurrentMapBackend
  # @return [MriMapBackend] a new instance of MriMapBackend
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#12
  def initialize(options = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#17
  def []=(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#61
  def clear; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#33
  def compute(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#21
  def compute_if_absent(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#29
  def compute_if_present(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#53
  def delete(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#57
  def delete_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#49
  def get_and_set(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#37
  def merge_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#45
  def replace_if_exists(key, new_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/mri_map_backend.rb#41
  def replace_pair(key, old_value, new_value); end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#9
class Concurrent::Collection::NonConcurrentMapBackend
  # WARNING: all public methods of the class must operate on the @backend
  # directly without calling each other. This is important because of the
  # SynchronizedMapBackend which uses a non-reentrant mutex for performance
  # reasons.
  #
  # @return [NonConcurrentMapBackend] a new instance of NonConcurrentMapBackend
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#15
  def initialize(options = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#19
  def [](key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#23
  def []=(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#92
  def clear; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#57
  def compute(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#27
  def compute_if_absent(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#51
  def compute_if_present(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#79
  def delete(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#83
  def delete_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#97
  def each_pair; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#69
  def get_and_set(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#108
  def get_or_default(key, default_value); end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#75
  def key?(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#61
  def merge_pair(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#44
  def replace_if_exists(key, new_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#35
  def replace_pair(key, old_value, new_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#104
  def size; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#19
  def _get(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#23
  def _set(key, value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#122
  def dupped_backend; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#116
  def initialize_copy(other); end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#126
  def pair?(key, expected_value); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/collection/map/non_concurrent_map_backend.rb#130
  def store_computed_value(key, new_value); end
end

# A thread-safe subclass of Hash. This version locks against the object
# itself for every method call, ensuring only one thread can be reading
# or writing at a time. This includes iteration methods like `#each`,
# which takes the lock repeatedly when reading an item.
#
# @see http://ruby-doc.org/core/Hash.html Ruby standard library `Hash`
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/hash.rb#56
class Concurrent::Hash < ::Hash; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/hash.rb#16
Concurrent::HashImplementation = Hash

# `Concurrent::Map` is a hash-like object and should have much better performance
# characteristics, especially under high concurrency, than `Concurrent::Hash`.
# However, `Concurrent::Map `is not strictly semantically equivalent to a ruby `Hash`
# -- for instance, it does not necessarily retain ordering by insertion time as `Hash`
# does. For most uses it should do fine though, and we recommend you consider
# `Concurrent::Map` instead of `Concurrent::Hash` for your concurrency-safe hash needs.
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#37
class Concurrent::Map < ::Concurrent::Collection::MriMapBackend
  # @return [Map] a new instance of Map
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#121
  def initialize(options = T.unsafe(nil), &block); end

  # Get a value with key
  #
  # @param key [Object]
  # @return [Object] the value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#135
  def [](key); end

  # Set a value with key
  #
  # @param key [Object]
  # @param value [Object]
  # @return [Object] the new value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#153
  def []=(key, value); end

  # Iterates over each key value pair.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each key value pair in the map
  # @yieldparam key [Object]
  # @yieldparam value [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#270
  def each; end

  # Iterates over each key.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each key in the map
  # @yieldparam key [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#251
  def each_key; end

  # Iterates over each key value pair.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each key value pair in the map
  # @yieldparam key [Object]
  # @yieldparam value [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#270
  def each_pair; end

  # Iterates over each value.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @return [self]
  # @yield for each value in the map
  # @yieldparam value [Object]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#260
  def each_value; end

  # Is map empty?
  #
  # @return [true, false]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#287
  def empty?; end

  # Get a value with key, or default_value when key is absent,
  # or fail when no default_value is given.
  #
  # @note The "fetch-then-act" methods of `Map` are not atomic. `Map` is intended
  #   to be use as a concurrency primitive with strong happens-before
  #   guarantees. It is not intended to be used as a high-level abstraction
  #   supporting complex operations. All read and write operations are
  #   thread safe, but no guarantees are made regarding race conditions
  #   between the fetch operation and yielding to the block. Additionally,
  #   this method does not support recursion. This is due to internal
  #   constraints that are very unlikely to change in the near future.
  # @param key [Object]
  # @param default_value [Object]
  # @raise [KeyError] when key is missing and no default_value is provided
  # @return [Object] the value or default value
  # @yield default value for a key
  # @yieldparam key [Object]
  # @yieldreturn [Object] default value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#178
  def fetch(key, default_value = T.unsafe(nil)); end

  # Fetch value with key, or store default value when key is absent,
  # or fail when no default_value is given. This is a two step operation,
  # therefore not atomic. The store can overwrite other concurrently
  # stored value.
  # This method is atomic.
  #
  # @note Atomic methods taking a block do not allow the `self` instance
  #   to be used within the block. Doing so will cause a deadlock.
  # @param key [Object]
  # @param default_value [Object]
  # @return [Object] the value or default value
  # @yield default value for a key
  # @yieldparam key [Object]
  # @yieldreturn [Object] default value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#201
  def fetch_or_store(key, default_value = T.unsafe(nil)); end

  # Get a value with key
  #
  # @param key [Object]
  # @return [Object] the value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#135
  def get(key); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#317
  def inspect; end

  # Find key of a value.
  #
  # @param value [Object]
  # @return [Object, nil] key or nil when not found
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#280
  def key(value); end

  # All keys
  #
  # @return [::Array<Object>] keys
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#232
  def keys; end

  # @raise [TypeError]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#301
  def marshal_dump; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#309
  def marshal_load(hash); end

  # Set a value with key
  #
  # @param key [Object]
  # @param value [Object]
  # @return [Object] the new value
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#153
  def put(key, value); end

  # Insert value into map with key if key is absent in one atomic step.
  #
  # @param key [Object]
  # @param value [Object]
  # @return [Object, nil] the previous value when key was present or nil when there was no key
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#211
  def put_if_absent(key, value); end

  # Is the value stored in the map. Iterates over all values.
  #
  # @param value [Object]
  # @return [true, false]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#223
  def value?(value); end

  # All values
  #
  # @return [::Array<Object>] values
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#240
  def values; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#327
  def initialize_copy(other); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#332
  def populate_from(hash); end

  # @raise [KeyError]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#323
  def raise_fetch_no_key; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/map.rb#337
  def validate_options_hash!(options); end
end

# Various classes within allows for +nil+ values to be stored,
# so a special +NULL+ token is required to indicate the "nil-ness".
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/constants.rb#6
Concurrent::NULL = T.let(T.unsafe(nil), Object)

# {include:file:docs-source/synchronization.md}
# {include:file:docs-source/synchronization-notes.md}
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_object.rb#2
module Concurrent::Synchronization; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_lockable_object.rb#5
class Concurrent::Synchronization::AbstractLockableObject < ::Concurrent::Synchronization::Object
  protected

  # Broadcast to all waiting threads.
  #
  # @note only to be used inside synchronized block
  # @note to provide direct access to this method in a descendant add method
  #   ```
  #   def broadcast
  #   synchronize { ns_broadcast }
  #   end
  #   ```
  # @raise [NotImplementedError]
  # @return [self]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_lockable_object.rb#92
  def ns_broadcast; end

  # Signal one waiting thread.
  #
  # @note only to be used inside synchronized block
  # @note to provide direct access to this method in a descendant add method
  #   ```
  #   def signal
  #   synchronize { ns_signal }
  #   end
  #   ```
  # @raise [NotImplementedError]
  # @return [self]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_lockable_object.rb#77
  def ns_signal; end

  # Wait until another thread calls #signal or #broadcast,
  # spurious wake-ups can happen.
  #
  # @note only to be used inside synchronized block
  # @note to provide direct access to this method in a descendant add method
  #   ```
  #   def wait(timeout = nil)
  #   synchronize { ns_wait(timeout) }
  #   end
  #   ```
  # @param timeout [Numeric, nil] in seconds, `nil` means no timeout
  # @raise [NotImplementedError]
  # @return [self]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_lockable_object.rb#62
  def ns_wait(timeout = T.unsafe(nil)); end

  # Wait until condition is met or timeout passes,
  # protects against spurious wake-ups.
  #
  # @note only to be used inside synchronized block
  # @note to provide direct access to this method in a descendant add method
  #   ```
  #   def wait_until(timeout = nil, &condition)
  #   synchronize { ns_wait_until(timeout, &condition) }
  #   end
  #   ```
  # @param timeout [Numeric, nil] in seconds, `nil` means no timeout
  # @return [true, false] if condition met
  # @yield condition to be met
  # @yieldreturn [true, false]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_lockable_object.rb#33
  def ns_wait_until(timeout = T.unsafe(nil), &condition); end

  # @note can by made public in descendants if required by `public :synchronize`
  # @raise [NotImplementedError]
  # @yield runs the block synchronized against this object,
  #   equivalent of java's `synchronize(this) {}`
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_lockable_object.rb#14
  def synchronize; end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_object.rb#6
class Concurrent::Synchronization::AbstractObject
  # @abstract has to be implemented based on Ruby runtime
  # @raise [NotImplementedError]
  # @return [AbstractObject] a new instance of AbstractObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_object.rb#9
  def initialize; end

  # @abstract
  # @raise [NotImplementedError]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_object.rb#15
  def full_memory_barrier; end

  class << self
    # @raise [NotImplementedError]
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/abstract_object.rb#19
    def attr_volatile(*names); end
  end
end

# TODO (pitr-ch 04-Dec-2016): should be in edge
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#6
class Concurrent::Synchronization::Condition < ::Concurrent::Synchronization::LockableObject
  # @return [Condition] a new instance of Condition
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#16
  def initialize(lock); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#45
  def broadcast; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#49
  def ns_broadcast; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#41
  def ns_signal; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#25
  def ns_wait(timeout = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#33
  def ns_wait_until(timeout = T.unsafe(nil), &condition); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#37
  def signal; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#21
  def wait(timeout = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#29
  def wait_until(timeout = T.unsafe(nil), &condition); end

  class << self
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#58
    def private_new(*args, &block); end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#7
module Concurrent::Synchronization::ConditionSignalling
  protected

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#15
  def ns_broadcast; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#10
  def ns_signal; end
end

# TODO (pitr-ch 04-Dec-2016): should be in edge
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lock.rb#7
class Concurrent::Synchronization::Lock < ::Concurrent::Synchronization::LockableObject
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lock.rb#29
  def broadcast; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lock.rb#23
  def signal; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lock.rb#11
  def wait(timeout = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lock.rb#17
  def wait_until(timeout = T.unsafe(nil), &condition); end
end

# Safe synchronization under any Ruby implementation.
#   It provides methods like {#synchronize}, {#wait}, {#signal} and {#broadcast}.
#   Provides a single layer which can improve its implementation over time without changes needed to
#   the classes using it. Use {Synchronization::Object} not this abstract class.
#
#   @note this object does not support usage together with
#     [`Thread#wakeup`](http://ruby-doc.org/core/Thread.html#method-i-wakeup)
#     and [`Thread#raise`](http://ruby-doc.org/core/Thread.html#method-i-raise).
#     `Thread#sleep` and `Thread#wakeup` will work as expected but mixing `Synchronization::Object#wait` and
#     `Thread#wakeup` will not work on all platforms.
#
#   @see Event implementation as an example of this class use
#
#   @example simple
#     class AnClass < Synchronization::Object
#       def initialize
#         super
#         synchronize { @value = 'asd' }
#       end
#
#       def value
#         synchronize { @value }
#       end
#     end
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lockable_object.rb#47
class Concurrent::Synchronization::LockableObject < ::Concurrent::Synchronization::MutexLockableObject
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/condition.rb#55
  def new_condition; end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/lockable_object.rb#6
Concurrent::Synchronization::LockableObjectImplementation = Concurrent::Synchronization::MutexLockableObject

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#59
class Concurrent::Synchronization::MonitorLockableObject < ::Concurrent::Synchronization::AbstractLockableObject
  include ::Concurrent::Synchronization::ConditionSignalling

  # @return [MonitorLockableObject] a new instance of MonitorLockableObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#64
  def initialize(*defaults); end

  protected

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#82
  def ns_wait(timeout = T.unsafe(nil)); end

  # TODO may be a problem with lock.synchronize { lock.wait }
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#78
  def synchronize; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#70
  def initialize_copy(other); end

  class << self
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#58
    def new(*args, &block); end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#5
module Concurrent::Synchronization::MriAttrVolatile
  mixes_in_class_methods ::Concurrent::Synchronization::MriAttrVolatile::ClassMethods

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#28
  def full_memory_barrier; end

  class << self
    # @private
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#6
    def included(base); end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#10
module Concurrent::Synchronization::MriAttrVolatile::ClassMethods
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#11
  def attr_volatile(*names); end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#36
class Concurrent::Synchronization::MriObject < ::Concurrent::Synchronization::AbstractObject
  include ::Concurrent::Synchronization::MriAttrVolatile
  extend ::Concurrent::Synchronization::MriAttrVolatile::ClassMethods

  # @return [MriObject] a new instance of MriObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mri_object.rb#39
  def initialize; end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#24
class Concurrent::Synchronization::MutexLockableObject < ::Concurrent::Synchronization::AbstractLockableObject
  include ::Concurrent::Synchronization::ConditionSignalling

  # @return [MutexLockableObject] a new instance of MutexLockableObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#29
  def initialize(*defaults); end

  protected

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#51
  def ns_wait(timeout = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#43
  def synchronize; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/mutex_lockable_object.rb#35
  def initialize_copy(other); end

  class << self
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#58
    def new(*args, &block); end
  end
end

# Abstract object providing final, volatile, ans CAS extensions to build other concurrent abstractions.
# - final instance variables see {Object.safe_initialization!}
# - volatile instance variables see {Object.attr_volatile}
# - volatile instance variables see {Object.attr_atomic}
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#26
class Concurrent::Synchronization::Object < ::Concurrent::Synchronization::MriObject
  # Has to be called by children.
  #
  # @return [Object] a new instance of Object
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#36
  def initialize; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#178
  def __initialize_atomic_fields__; end

  class << self
    # @return [true, false] is the attribute with name atomic?
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#157
    def atomic_attribute?(name); end

    # @param inherited [true, false] should inherited volatile with CAS fields be returned?
    # @return [::Array<Symbol>] Returns defined volatile with CAS fields on this class.
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#151
    def atomic_attributes(inherited = T.unsafe(nil)); end

    # Creates methods for reading and writing to a instance variable with
    # volatile (Java) semantic as {.attr_volatile} does.
    # The instance variable should be accessed oly through generated methods.
    # This method generates following methods: `value`, `value=(new_value) #=> new_value`,
    # `swap_value(new_value) #=> old_value`,
    # `compare_and_set_value(expected, value) #=> true || false`, `update_value(&block)`.
    #
    # @param names [::Array<Symbol>] of the instance variables to be volatile with CAS.
    # @return [::Array<Symbol>] names of defined method names.
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#116
    def attr_atomic(*names); end

    # For testing purposes, quite slow. Injects assert code to new method which will raise if class instance contains
    # any instance variables with CamelCase names and isn't {.safe_initialization?}.
    #
    # @raise when offend found
    # @return [true]
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#77
    def ensure_safe_initialization_when_final_fields_are_present; end

    # By calling this method on a class, it and all its children are marked to be constructed safely. Meaning that
    # all writes (ivar initializations) are made visible to all readers of newly constructed object. It ensures
    # same behaviour as Java's final fields.
    #
    # @example
    #   class AClass < Concurrent::Synchronization::Object
    #   safe_initialization!
    #
    #   def initialize
    #   @AFinalValue = 'value' # published safely, does not have to be synchronized
    #   end
    #   end
    # @return [true]
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#53
    def safe_initialization!; end

    # @return [true, false] if this class is safely initialized.
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#68
    def safe_initialization?; end

    private

    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#163
    def define_initialize_atomic_fields; end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#6
Concurrent::Synchronization::ObjectImplementation = Concurrent::Synchronization::MriObject

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#5
module Concurrent::Synchronization::RbxAttrVolatile
  mixes_in_class_methods ::Concurrent::Synchronization::RbxAttrVolatile::ClassMethods

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#32
  def full_memory_barrier; end

  class << self
    # @private
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#6
    def included(base); end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#10
module Concurrent::Synchronization::RbxAttrVolatile::ClassMethods
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#12
  def attr_volatile(*names); end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#6
class Concurrent::Synchronization::RbxLockableObject < ::Concurrent::Synchronization::AbstractLockableObject
  # @return [RbxLockableObject] a new instance of RbxLockableObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#9
  def initialize(*defaults); end

  protected

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#65
  def ns_broadcast; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#60
  def ns_signal; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#40
  def ns_wait(timeout = T.unsafe(nil)); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#23
  def synchronize(&block); end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_lockable_object.rb#15
  def initialize_copy(other); end

  class << self
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/object.rb#58
    def new(*args, &block); end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#41
class Concurrent::Synchronization::RbxObject < ::Concurrent::Synchronization::AbstractObject
  include ::Concurrent::Synchronization::RbxAttrVolatile
  extend ::Concurrent::Synchronization::RbxAttrVolatile::ClassMethods

  # @return [RbxObject] a new instance of RbxObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/rbx_object.rb#44
  def initialize; end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#5
module Concurrent::Synchronization::TruffleRubyAttrVolatile
  mixes_in_class_methods ::Concurrent::Synchronization::TruffleRubyAttrVolatile::ClassMethods

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#32
  def full_memory_barrier; end

  class << self
    # @private
    #
    # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#6
    def included(base); end
  end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#10
module Concurrent::Synchronization::TruffleRubyAttrVolatile::ClassMethods
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#11
  def attr_volatile(*names); end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#39
class Concurrent::Synchronization::TruffleRubyObject < ::Concurrent::Synchronization::AbstractObject
  include ::Concurrent::Synchronization::TruffleRubyAttrVolatile
  extend ::Concurrent::Synchronization::TruffleRubyAttrVolatile::ClassMethods

  # @return [TruffleRubyObject] a new instance of TruffleRubyObject
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/truffleruby_object.rb#42
  def initialize; end
end

# Volatile adds the attr_volatile class method when included.
#
#  foo = Foo.new
#  foo.bar
#  => 1
#  foo.bar = 2
#  => 2
#
# @example
#   class Foo
#   include Concurrent::Synchronization::Volatile
#
#   attr_volatile :bar
#
#   def initialize
#   self.bar = 1
#   end
#   end
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/synchronization/volatile.rb#23
Concurrent::Synchronization::Volatile = Concurrent::Synchronization::MriAttrVolatile

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#4
module Concurrent::ThreadSafe; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#7
module Concurrent::ThreadSafe::Util; end

# TODO (pitr-ch 15-Oct-2016): migrate to Utility::ProcessorCounter
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#13
Concurrent::ThreadSafe::Util::CPU_COUNT = T.let(T.unsafe(nil), Integer)

# TODO (pitr-ch 15-Oct-2016): migrate to Utility::NativeInteger
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#10
Concurrent::ThreadSafe::Util::FIXNUM_BIT_SIZE = T.let(T.unsafe(nil), Integer)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#11
Concurrent::ThreadSafe::Util::MAX_INT = T.let(T.unsafe(nil), Integer)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#2
module Concurrent::Utility; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#5
module Concurrent::Utility::EngineDetector
  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#14
  def on_cruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#6
  def on_jruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#10
  def on_jruby_9000?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#34
  def on_linux?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#30
  def on_osx?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#18
  def on_rbx?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#22
  def on_truffleruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#26
  def on_windows?; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#38
  def ruby_engine; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#42
  def ruby_version(version = T.unsafe(nil), comparison, major, minor, patch); end
end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#8
module Concurrent::Utility::NativeExtensionLoader
  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#10
  def allow_c_extensions?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#14
  def c_extensions_loaded?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#18
  def java_extensions_loaded?; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#22
  def load_native_extensions; end

  private

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#45
  def load_error_path(error); end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#53
  def set_c_extensions_loaded; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#57
  def set_java_extensions_loaded; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/native_extension_loader.rb#61
  def try_load_c_extension(path); end
end
