# try except block for cron to work in any case

try:

    import logging

    # Configure the logging settings
    logging.basicConfig(
        filename='/app/log.log',
        level=logging.INFO,  # Set the minimum logging level
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )

    # Create a logger instance
    logger = logging.getLogger("Logger")

    # Log information
    logger.info("Log message")

    # Add this to cron logs
    print('chron executed')
    
except:
    
    print('Error in script')