/// Represents the result of a GraphQL operation.
public struct GraphQLResult<Data>: Parseable {
  
  public init<T>(from data: Foundation.Data, decoder: T) throws where T : FlexibleDecoder {
    throw ParseableError.unsupportedInitializer
  }
  
  /// The typed result data, or `nil` if an error was encountered that prevented a valid response.
  public let data: Data?
  /// A list of errors, or `nil` if the operation completed without encountering any errors.
  public let errors: [GraphQLError]?

  /// Represents source of data
  public enum Source {
    case cache
    case server
  }
  /// Source of data
  public let source: Source

  let dependentKeys: Set<CacheKey>?

  public init(data: Data?,
              errors: [GraphQLError]?,
              source: Source,
              dependentKeys: Set<CacheKey>?) {
    self.data = data
    self.errors = errors
    self.source = source
    self.dependentKeys = dependentKeys
  }
}
