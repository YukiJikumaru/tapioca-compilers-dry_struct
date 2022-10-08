# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dry-core` gem.
# Please instead update this file by running `bin/tapioca gem dry-core`.

# This implementation was imported from `hanami-utils` gem.
#
# source://dry-core//lib/dry/core/extensions.rb#5
module Dry
  class << self
    # Build an equalizer module for the inclusion in other class
    #
    # ## Credits
    #
    # Equalizer has been originally imported from the equalizer gem created by Dan Kubb
    #
    # @api public
    #
    # source://dry-core//lib/dry/core/equalizer.rb#11
    def Equalizer(*keys, **options); end

    # source://dry-struct/1.4.0/lib/dry/struct.rb#33
    def Struct(attributes = T.unsafe(nil), &block); end

    # source://dry-types/1.5.1/lib/dry/types.rb#226
    def Types(*namespaces, default: T.unsafe(nil), **aliases); end
  end
end

# source://dry-core//lib/dry/core/extensions.rb#6
module Dry::Core; end

# Internal support module for class-level settings
#
# @api public
#
# source://dry-core//lib/dry/core/class_attributes.rb#11
module Dry::Core::ClassAttributes
  include ::Dry::Core::Constants

  # Specify what attributes a class will use
  #
  # @api public
  # @example
  #   class ExtraClass
  #   extend Dry::Core::ClassAttributes
  #
  #   defines :hello
  #
  #   hello 'world'
  #   end
  # @example with inheritance and type checking
  #
  #   class MyClass
  #   extend Dry::Core::ClassAttributes
  #
  #   defines :one, :two, type: Integer
  #
  #   one 1
  #   two 2
  #   end
  #
  #   class OtherClass < MyClass
  #   two 3
  #   end
  #
  #   MyClass.one # => 1
  #   MyClass.two # => 2
  #
  #   OtherClass.one # => 1
  #   OtherClass.two # => 3
  # @example with dry-types
  #
  #   class Foo
  #   extend Dry::Core::ClassAttributes
  #
  #   defines :one, :two, type: Dry::Types['strict.int']
  #   end
  # @example with coercion using Proc
  #
  #   class Bar
  #   extend Dry::Core::ClassAttributes
  #
  #   defines :one, coerce: proc { |value| value.to_s }
  #   end
  # @example with coercion using dry-types
  #
  #   class Bar
  #   extend Dry::Core::ClassAttributes
  #
  #   defines :one, coerce: Dry::Types['coercible.string']
  #   end
  #
  # source://dry-core//lib/dry/core/class_attributes.rb#70
  def defines(*args, type: T.unsafe(nil), coerce: T.unsafe(nil)); end
end

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::EMPTY_HASH = T.let(T.unsafe(nil), Hash)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::EMPTY_OPTS = T.let(T.unsafe(nil), Hash)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::EMPTY_SET = T.let(T.unsafe(nil), Set)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::EMPTY_STRING = T.let(T.unsafe(nil), String)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::IDENTITY = T.let(T.unsafe(nil), Proc)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::Self = T.let(T.unsafe(nil), Proc)

# source://dry-core//lib/dry/core/constants.rb#112
Dry::Core::ClassAttributes::Undefined = T.let(T.unsafe(nil), Object)

# A list of constants you can use to avoid memory allocations or identity checks.
#
# @api public
# @example Just include this module to your class or module
#   class Foo
#   include Dry::Core::Constants
#   def call(value = EMPTY_ARRAY)
#   value.map(&:to_s)
#   end
#   end
#
# source://dry-core//lib/dry/core/constants.rb#18
module Dry::Core::Constants
  class << self
    # @api public
    # @private
    #
    # source://dry-core//lib/dry/core/constants.rb#108
    def included(base); end
  end
end

# An empty array
#
# @api public
#
# source://dry-core//lib/dry/core/constants.rb#20
Dry::Core::Constants::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)

# An empty hash
#
# @api public
#
# source://dry-core//lib/dry/core/constants.rb#22
Dry::Core::Constants::EMPTY_HASH = T.let(T.unsafe(nil), Hash)

# An empty list of options
#
# @api public
#
# source://dry-core//lib/dry/core/constants.rb#24
Dry::Core::Constants::EMPTY_OPTS = T.let(T.unsafe(nil), Hash)

# An empty set
#
# @api public
#
# source://dry-core//lib/dry/core/constants.rb#26
Dry::Core::Constants::EMPTY_SET = T.let(T.unsafe(nil), Set)

# An empty string
#
# @api public
#
# source://dry-core//lib/dry/core/constants.rb#28
Dry::Core::Constants::EMPTY_STRING = T.let(T.unsafe(nil), String)

# Identity function
#
# @api public
#
# source://dry-core//lib/dry/core/constants.rb#30
Dry::Core::Constants::IDENTITY = T.let(T.unsafe(nil), Proc)

# source://dry-core//lib/dry/core/constants.rb#45
Dry::Core::Constants::Self = T.let(T.unsafe(nil), Proc)

# A special value you can use as a default to know if no arguments
# were passed to the method
#
# @api public
# @example
#   def method(value = Undefined)
#   if Undefined.equal?(value)
#   puts 'no args'
#   else
#   puts value
#   end
#   end
#
# source://dry-core//lib/dry/core/constants.rb#43
Dry::Core::Constants::Undefined = T.let(T.unsafe(nil), Object)

# An extension for issuing warnings on using deprecated methods.
#
# @api public
# @example
#
#   class Foo
#   def self.old_class_api; end
#   def self.new_class_api; end
#
#   deprecate_class_method :old_class_api, :new_class_api
#
#   def old_api; end
#   def new_api; end
#
#   deprecate :old_api, :new_api, message: "old_api is no-no"
#   end
# @example You also can use this module for your custom messages
#
#   Dry::Core::Deprecations.announce("Foo", "use bar instead")
#   Dry::Core::Deprecations.warn("Baz is going to be removed soon")
#
# source://dry-core//lib/dry/core/deprecations.rb#29
module Dry::Core::Deprecations
  class << self
    # @api public
    #
    # source://dry-core//lib/dry/core/deprecations.rb#115
    def [](tag); end

    # Wraps arguments with a standard message format and prints a warning
    #
    # @api public
    # @param name [Object] what is deprecated
    # @param msg [String] additional message usually containing upgrade instructions
    #
    # source://dry-core//lib/dry/core/deprecations.rb#51
    def announce(name, msg, tag: T.unsafe(nil), uplevel: T.unsafe(nil)); end

    # @api private
    #
    # source://dry-core//lib/dry/core/deprecations.rb#68
    def deprecated_name_message(old, new = T.unsafe(nil), msg = T.unsafe(nil)); end

    # @api private
    #
    # source://dry-core//lib/dry/core/deprecations.rb#60
    def deprecation_message(name, msg); end

    # Returns the logger used for printing warnings.
    # You can provide your own with .set_logger!
    #
    # @api public
    # @param output [IO] output stream
    # @return [Logger]
    #
    # source://dry-core//lib/dry/core/deprecations.rb#85
    def logger(output = T.unsafe(nil)); end

    # Sets a custom logger. This is a global setting.
    #
    # @api public
    # @overload set_logger!
    # @overload set_logger!
    # @overload set_logger!
    #
    # source://dry-core//lib/dry/core/deprecations.rb#105
    def set_logger!(output = T.unsafe(nil)); end

    # Prints a warning
    #
    # @api public
    # @param msg [String] Warning string
    # @param tag [String] Tag to help identify the source of the warning.
    #   Defaults to "deprecated"
    # @param Caller [Integer] frame to add to the message
    #
    # source://dry-core//lib/dry/core/deprecations.rb#39
    def warn(msg, tag: T.unsafe(nil), uplevel: T.unsafe(nil)); end
  end
end

# @api public
#
# source://dry-core//lib/dry/core/deprecations.rb#133
module Dry::Core::Deprecations::Interface
  # Mark instance method as deprecated
  #
  # @api public
  # @option [String]
  # @param old_name [Symbol] deprecated method
  # @param new_name [Symbol] replacement (not required)
  # @param [String] [Hash] a customizable set of options
  #
  # source://dry-core//lib/dry/core/deprecations.rb#157
  def deprecate(old_name, new_name = T.unsafe(nil), message: T.unsafe(nil)); end

  # Mark class-level method as deprecated
  #
  # @api public
  # @option [String]
  # @param old_name [Symbol] deprecated method
  # @param new_name [Symbol] replacement (not required)
  # @param [String] [Hash] a customizable set of options
  #
  # source://dry-core//lib/dry/core/deprecations.rb#190
  def deprecate_class_method(old_name, new_name = T.unsafe(nil), message: T.unsafe(nil)); end

  # Mark a constant as deprecated
  #
  # @api public
  # @option [String]
  # @param constant_name [Symbol] constant name to be deprecated
  # @param [String] [Hash] a customizable set of options
  #
  # source://dry-core//lib/dry/core/deprecations.rb#212
  def deprecate_constant(constant_name, message: T.unsafe(nil)); end

  # Sets/gets deprecation tag
  #
  # @api public
  # @option [String,Symbol]
  # @param [String,Symbol] [Hash] a customizable set of options
  #
  # source://dry-core//lib/dry/core/deprecations.rb#137
  def deprecation_tag(tag = T.unsafe(nil)); end

  # Issue a tagged warning message
  #
  # @api public
  # @param msg [String] warning message
  #
  # source://dry-core//lib/dry/core/deprecations.rb#148
  def warn(msg); end
end

# @api public
#
# source://dry-core//lib/dry/core/deprecations.rb#30
Dry::Core::Deprecations::STACK = T.let(T.unsafe(nil), Proc)

# @api private
#
# source://dry-core//lib/dry/core/deprecations.rb#121
class Dry::Core::Deprecations::Tagged < ::Module
  # @api private
  # @return [Tagged] a new instance of Tagged
  #
  # source://dry-core//lib/dry/core/deprecations.rb#122
  def initialize(tag); end

  # @api private
  #
  # source://dry-core//lib/dry/core/deprecations.rb#127
  def extended(base); end
end

# An implementation of descendants tracker, heavily inspired
# by the descendants_tracker gem.
#
# @example
#
#   class Base
#   extend Dry::Core::DescendantsTracker
#   end
#
#   class A < Base
#   end
#
#   class B < Base
#   end
#
#   class C < A
#   end
#
#   Base.descendants # => [C, B, A]
#   A.descendants # => [C]
#   B.descendants # => []
#
# source://dry-core//lib/dry/core/descendants_tracker.rb#29
module Dry::Core::DescendantsTracker
  # Return the descendants of this class
  #
  # @api public
  # @example
  #   descendants = Parent.descendants
  # @return [Array<Class>]
  #
  # source://dry-core//lib/dry/core/descendants_tracker.rb#54
  def descendants; end

  protected

  # @api private
  #
  # source://dry-core//lib/dry/core/descendants_tracker.rb#59
  def add_descendant(descendant); end

  private

  # @api private
  #
  # source://dry-core//lib/dry/core/descendants_tracker.rb#70
  def inherited(descendant); end

  class << self
    # @api private
    #
    # source://dry-core//lib/dry/core/descendants_tracker.rb#32
    def setup(target); end

    private

    # @api private
    # @private
    #
    # source://dry-core//lib/dry/core/descendants_tracker.rb#39
    def extended(base); end
  end
end

# Define equality, equivalence and inspection methods
#
# source://dry-core//lib/dry/core/equalizer.rb#30
class Dry::Core::Equalizer < ::Module
  # Initialize an Equalizer with the given keys
  #
  # Will use the keys with which it is initialized to define #cmp?,
  # #hash, and #inspect
  #
  # @api private
  # @option options
  # @option options
  # @param keys [Array<Symbol>]
  # @param options [Hash]
  # @return [undefined]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#31
  def initialize(*keys, **options); end

  private

  # Define an #cmp? method based on the instance's values identified by #keys
  #
  # @api private
  # @return [undefined]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#72
  def define_cmp_method; end

  # Define a #hash method based on the instance's values identified by #keys
  #
  # @api private
  # @return [undefined]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#87
  def define_hash_method(immutable:); end

  # Define an inspect method that reports the values of the instance's keys
  #
  # @api private
  # @return [undefined]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#109
  def define_inspect_method; end

  # Define the equalizer methods based on #keys
  #
  # @api private
  # @param inspect [Boolean] whether to define #inspect method
  # @param immutable [Boolean] whether to memoize #hash method
  # @return [undefined]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#61
  def define_methods(inspect: T.unsafe(nil), immutable: T.unsafe(nil)); end

  # Hook called when module is included
  #
  # @api private
  # @param descendant [Module] the module or class including Equalizer
  # @return [self]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#48
  def included(descendant); end
end

# The comparison methods
#
# source://dry-core//lib/dry/core/equalizer.rb#119
module Dry::Core::Equalizer::Methods
  # Compare the object with other object for equivalency
  #
  # @api public
  # @example
  #   object == other  # => true or false
  # @param other [Object] the other object to compare with
  # @return [Boolean]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#146
  def ==(other); end

  # Compare the object with other object for equality
  #
  # @api public
  # @example
  #   object.eql?(other)  # => true or false
  # @param other [Object] the other object to compare with
  # @return [Boolean]
  #
  # source://dry-core//lib/dry/core/equalizer.rb#131
  def eql?(other); end
end

# Define extensions that can be later enabled by the user.
#
# @example
#
#   class Foo
#   extend Dry::Core::Extensions
#
#   register_extension(:bar) do
#   def bar; :bar end
#   end
#   end
#
#   Foo.new.bar # => NoMethodError
#   Foo.load_extensions(:bar)
#   Foo.new.bar # => :bar
#
# source://dry-core//lib/dry/core/extensions.rb#23
module Dry::Core::Extensions
  # Whether an extension is available
  #
  # @param name [Symbol] extension name
  # @return [Boolean] Extension availability
  #
  # source://dry-core//lib/dry/core/extensions.rb#43
  def available_extension?(name); end

  # Enables specified extensions. Already enabled extensions remain untouched
  #
  # @param extensions [Array<Symbol>] list of extension names
  #
  # source://dry-core//lib/dry/core/extensions.rb#50
  def load_extensions(*extensions); end

  # Register an extension
  #
  # @param name [Symbol] extension name
  # @yield extension block. This block guaranteed not to be called more than once
  #
  # source://dry-core//lib/dry/core/extensions.rb#35
  def register_extension(name, &block); end

  class << self
    # @api private
    # @private
    #
    # source://dry-core//lib/dry/core/extensions.rb#25
    def extended(obj); end
  end
end

# Helper module providing thin interface around an inflection backend.
#
# source://dry-core//lib/dry/core/inflector.rb#6
module Dry::Core::Inflector
  class << self
    # Transform string to camel case
    #
    # @example
    #   Dry::Core::Inflector.camelize('foo_bar') # => 'FooBar'
    # @param input [String] input string
    # @return Transformed string
    #
    # source://dry-core//lib/dry/core/inflector.rb#70
    def camelize(input); end

    # Transform a file path to a constant name
    #
    # @example
    #   Dry::Core::Inflector.classify('foo/bar') # => 'Foo::Bar'
    # @param input [String] input string
    # @return Constant name
    #
    # source://dry-core//lib/dry/core/inflector.rb#136
    def classify(input); end

    # Get a constant value by its name
    #
    # @example
    #   Dry::Core::Inflector.constantize('Foo::Bar') # => Foo::Bar
    # @param input [String] input constant name
    # @return Constant value
    #
    # source://dry-core//lib/dry/core/inflector.rb#125
    def constantize(input); end

    # Remove namespaces from a constant name
    #
    # @example
    #   Dry::Core::Inflector.demodulize('Deeply::Nested::Name') # => 'Name'
    # @param input [String] input string
    # @return Unnested constant name
    #
    # source://dry-core//lib/dry/core/inflector.rb#114
    def demodulize(input); end

    # Set up first available backend
    #
    # @api private
    #
    # source://dry-core//lib/dry/core/inflector.rb#37
    def detect_backend; end

    # Inflector accessor. Lazily initializes a backend
    #
    # @api private
    #
    # source://dry-core//lib/dry/core/inflector.rb#59
    def inflector; end

    # Get a plural form of a word
    #
    # @example
    #   Dry::Core::Inflector.pluralize('string') # => 'strings'
    # @param input [String] input string
    # @return Transformed string
    #
    # source://dry-core//lib/dry/core/inflector.rb#103
    def pluralize(input); end

    # Try to activate a backend
    #
    # @api private
    #
    # source://dry-core//lib/dry/core/inflector.rb#26
    def realize_backend(path, backend_factory); end

    # Set preferred backend
    #
    # @param name [Symbol] backend name (:activesupport or :inflecto)
    #
    # source://dry-core//lib/dry/core/inflector.rb#48
    def select_backend(name = T.unsafe(nil)); end

    # Get a singlular form of a word
    #
    # @example
    #   Dry::Core::Inflector.singularize('chars') # => 'char'
    # @param input [String] input string
    # @return Transformed string
    #
    # source://dry-core//lib/dry/core/inflector.rb#92
    def singularize(input); end

    # Transform string to snake case
    #
    # @example
    #   Dry::Core::Inflector.underscore('FooBar') # => 'foo_bar'
    # @param input [String] input string
    # @return Transformed string
    #
    # source://dry-core//lib/dry/core/inflector.rb#81
    def underscore(input); end
  end
end

# List of supported backends
#
# source://dry-core//lib/dry/core/inflector.rb#8
Dry::Core::Inflector::BACKENDS = T.let(T.unsafe(nil), Hash)

# source://dry-core//lib/dry/core/errors.rb#5
class Dry::Core::InvalidClassAttributeValue < ::StandardError
  # @return [InvalidClassAttributeValue] a new instance of InvalidClassAttributeValue
  #
  # source://dry-core//lib/dry/core/errors.rb#6
  def initialize(name, value); end
end