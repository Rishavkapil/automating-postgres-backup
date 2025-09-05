# TO Automate the backup of POSTGRES data using bash script

You just need to run docker containers 


------------------

to do this 

```
docker-compose up -d

```

------------------

then you need to create a cronjob for automating , like here i did to automate backup every 5 minutes . 


```
*/5 * * * * /home/user/testing/postgres.sh >> /home/user/testing/postgres_backup.log 2>&1
```

------------------------------------


NOTE : Also make sure to make the script executable else it will not work. 

also change all the directories in which your files are placed. 
