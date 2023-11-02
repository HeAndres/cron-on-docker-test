## Cron on docker - test

Cron fails silently if not configured properly, thus making it difficult to debug.
This repository provides a working example of cron inside a docker container, as well as key takeaways and a simple way to validate that everything is running as expected.

For this test, cron is configured to run a python script every minute. The executed script logs the date and time of execution to a python log, and prints a message to cron log.


#### Key takeaways
1. Use LF as EOL Sequence (you can set this in VSCode on the lower right corner).
2. Crontab schedule file must end with an empty line.
3. Crontab schedule file must be readable. Set the right permissions with chmod 0644 cron-jobs.
4. Python script must be executable. Set the right permissions with chmod 0744 script.py.
5. Cron is prone to failling silently, so it is hard to debug any errors.



#### How to check that everything is working

1. Build the image with the following command on a linux terminal

```
>>> sudo docker build . -t cron_test
```

2. Run container. The entrypoint monitors the cron log, so you should be seeing a message printed every minute on the clock.

```
>>> sudo docker run --name ct cron_test
```

3. Run container on interactive mode and check python logs

```
>>> sudo docker run -it --entrypoint /bin/bash --name ct2 cron_test
```

```
>>> cron # Run cron on background
```

```
>>> pstree -ap `pidof cron` # Check if cron is running (expect something like "cron,10")
```


```
>>> tail -f /app/log.log # Monitor cron logs
```

4. Clean workspace - remove containers and images

```
>>> sudo docker container rm ct ct2
>>> docker image rm cron_test python:3.11
```
