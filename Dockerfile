FROM python:3.11

# Install Cron
RUN apt-get update && apt-get install -y cron

# Copy your application code
COPY script.py /app/
WORKDIR /app

RUN chmod 0744 script.py

COPY cron-jobs /etc/cron.d/cron-jobs

RUN chmod 0644 /etc/cron.d/cron-jobs

RUN crontab /etc/cron.d/cron-jobs

RUN touch /var/log/cron.log

RUN cron

# CMD ["/bin/bash"]
CMD cron && tail -f /var/log/cron.log