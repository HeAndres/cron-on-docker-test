try:

    import logging

    # Configure the logging settings
    logging.basicConfig(
        filename='log.log', #/app/logs/
        level=logging.INFO,  # Set the minimum logging level
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )

    # Create a logger instance
    logger = logging.getLogger("Logger")

    # Log a message
    logger.info("Log message")

    print('chron executed')

    with open('a', 'a') as f:
        f.write('Hola')
        
except:
    
    print('Error in script')