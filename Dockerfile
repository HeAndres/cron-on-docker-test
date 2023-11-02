FROM python:3.11

# Install Cron
RUN apt-get update && apt-get install -y cron

# Copy your application code
COPY script.py /app/
WORKDIR /app

# Ensure script.py is executable by cron (e.g., exetutable by root)
RUN chmod 0744 script.py

# Add cron-jobs file to docker
COPY cron-jobs /etc/cron.d/cron-jobs

# Ensure cron-jobs is readable by cron (e.g., readable by root)
RUN chmod 0644 /etc/cron.d/cron-jobs

# Set cron-jobs as crontab (cron schedule)
RUN crontab /etc/cron.d/cron-jobs

# Create cron and python log files to be able to run tail -f from the beggining
#  (otherwise, this files would be created when the jobs are executed)
RUN touch /var/log/cron.log
RUN touch /app/log.log

# By default, when running a container, run cron and monitor cron log
CMD cron && tail -f /var/log/cron.log