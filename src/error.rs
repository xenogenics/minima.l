use thiserror::Error;

#[derive(Debug, Error)]
pub enum Error {
    #[error("Expected function call")]
    ExpectedFunctionCall,
    #[error("Expected function definition")]
    ExpectedFunctionDefinition,
    #[error("Expected pair")]
    ExpectedPair,
    #[error("Expected symbol")]
    ExpectedSymbol,
    #[error("Function already defined: {0}")]
    FunctionAlreadyDefined(Box<str>),
    #[error("Function definition can only happen at the top level")]
    FunctionDefinitionTopLevelOnly,
    #[error("Invalid symbol: {0}")]
    InvalidSymbol(Box<str>),
    #[error(transparent)]
    Io(#[from] std::io::Error),
}
