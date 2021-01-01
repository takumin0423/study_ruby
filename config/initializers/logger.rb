any_logger = AnyLogger.instance
any_logger.add_operation(Commands::BugReportCommand, Decorators::JsonDecorator)
any_logger.add_operation(Commands::DBCommand, Decorators::QueryDecorator)
any_logger.add_operation(Commands::TextLogCommand, Decorators::TextDecorator)