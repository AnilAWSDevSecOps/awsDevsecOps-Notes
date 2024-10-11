# Databases:
## Structured Data:
  - AWS RDS - MySQL, MSSQL, Oracle, Postgres, MariaDB, Arora
## Unstructured Data:
  - AWS Dynamo DB, DocumentDB, Cassandra
## In-Memory Databases:
  - ElastiCache


# 30. AWS RDS:
  - Before Creating Database we need to create the ```Subnetgroup```
  - Come to Amazon RDS > Subnetgroup > Create DB Subnet group
    ![994](https://github.com/user-attachments/assets/1692fe40-43c3-411d-8f2b-9975f5994e69)
    
  - Fill in the details.
    
    ![995](https://github.com/user-attachments/assets/0812facc-0cdf-4a1a-b670-0d36d9b0cc31)
    ![996](https://github.com/user-attachments/assets/f9c3e717-22fd-46a1-9a12-2afe477d337d)
    ![997](https://github.com/user-attachments/assets/b2f61a50-c57b-4a34-9662-4f623927e47d)

  - RDS > Database > Create database
    ![998](https://github.com/user-attachments/assets/1a73f72f-1c13-4122-a052-8247d9884af2)
    ![999](https://github.com/user-attachments/assets/c4eb90ab-d2cd-48ed-8880-9d9a737e51cd)
    ![1000](https://github.com/user-attachments/assets/f595e628-7648-4b94-abae-b30853a5c220)
    ![1001](https://github.com/user-attachments/assets/15f283fa-023e-42ad-a872-9df073037a14)
    ![1002](https://github.com/user-attachments/assets/16d538de-2f86-4193-a742-eb99e18f89d1)
    ![1003](https://github.com/user-attachments/assets/e190fc49-2e3e-4273-a431-63b0bbf34198)
    ![1004](https://github.com/user-attachments/assets/e6b1a770-348b-4deb-b07a-3ec17a4f447b)
    ![1005](https://github.com/user-attachments/assets/1e8ec08e-50ad-4eeb-ad78-3e48127dde97)
    ![1006](https://github.com/user-attachments/assets/d1541698-b998-488c-8b3f-f2ff0019c779)
    ![1007](https://github.com/user-attachments/assets/d5307052-38da-4305-97ab-7ce6975ef5fa)
    ![1008](https://github.com/user-attachments/assets/f57b86a6-bdca-4fbf-a518-dd0be8026370)
    ![1008-01](https://github.com/user-attachments/assets/bce9353e-1d72-4ad3-b491-59d0b2d2c8df)

  - Diagram Demonstrating the Database Architecture
    ![1009](https://github.com/user-attachments/assets/6a4839a2-ca8f-4fde-832c-7b3a5093b20d)

  - Now we need to connect to the database. 
  - There are two ways in connecting.
    - 1. Admin Connecting to DB (Needs MySQL WorkBench)
    - 2. App Connecting to DB.
  - So we need to download the workbench app and should install it.
    - Install Latest Microsoft Visual C++ Redistributable Version with below link.
      ```
      https://aka.ms/vs/17/release/vc_redist.x64.exe
      ```
    - Install Workbench app with below link.
      ```
      https://dev.mysql.com/downloads/workbench/
      ```

  - After installing it looks like this when you open the workbench app.
    ![1010](https://github.com/user-attachments/assets/2c804897-1e81-4de6-b110-be919fb02e77)

  ## COnnecting RDS in WorkBench
  - Copy the Database Endpoint.    
    ![1012](https://github.com/user-attachments/assets/6853bda2-f287-4fac-a5c0-c44c99be26a0)
    ```
    demoapp-database-1.cxia00csqptb.us-east-1.rds.amazonaws.com
    ```
  - Click on Plus button
    ![1013](https://github.com/user-attachments/assets/5e33751d-2a2c-4a95-b6ce-37cb7eae683e)

  - Fill in the details, Name, Hostname(RDS Endpoint) and click on test connection.
    ![1014](https://github.com/user-attachments/assets/3e9a8ab2-4724-47cf-a872-75b7ae8fcedc)

  - Enter the password and clcik on ok.
    ![1015](https://github.com/user-attachments/assets/e013596d-75d2-4fae-87b7-7c48c03c3c6f)

  - You will get the successful message.
    ![1016](https://github.com/user-attachments/assets/7b1f1d78-57b1-4a6b-af63-c07bfe28cb18)

  - Click ok to finish and add the RDS in the work bench.
    ![1017](https://github.com/user-attachments/assets/50cb4ceb-617f-4d0a-b735-0e44f2648e09)

  - RDS Added successfully. oprn it.
    ![1018](https://github.com/user-attachments/assets/103f2569-cd5f-4109-9124-2a33b9145b83)
    ![1019](https://github.com/user-attachments/assets/c8814781-f6a6-4f26-9c57-3dc10ca4342b)

  - It looks this way.
    ![1020](https://github.com/user-attachments/assets/edc3116f-2b92-4e7a-b372-f019b7582d3a)

  - Under schemas in home page click on Add button.
    ![1021](https://github.com/user-attachments/assets/087ac4a9-f352-469c-b635-6c73ee0c45ad)
    
    ### Data From line 1 to 247
    ```
    CREATE DATABASE  IF NOT EXISTS `myflixdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
    USE `myflixdb`;
    -- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
    --
    -- Host: localhost    Database: myflixdb
    -- ------------------------------------------------------
    -- Server version	5.5.25a
    
    /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
    /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
    /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
    /*!40101 SET NAMES utf8 */;
    /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
    /*!40103 SET TIME_ZONE='+00:00' */;
    /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
    /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
    /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
    /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
    
    --
    -- Table structure for table `movies`
    --
    
    DROP TABLE IF EXISTS `movies`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `movies` (
      `movie_id` int(11) NOT NULL AUTO_INCREMENT,
      `title` varchar(300) DEFAULT NULL,
      `director` varchar(150) DEFAULT NULL,
      `year_released` year(4) DEFAULT NULL,
      `category_id` int(11) DEFAULT NULL,
      PRIMARY KEY (`movie_id`),
      KEY `fk_Movies_Categories1` (`category_id`),
      KEY `title_index` (`title`),
      KEY `qw` (`title`),
      CONSTRAINT `fk_Movies_Categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
    
    --
    -- Dumping data for table `movies`
    --
    
    LOCK TABLES `movies` WRITE;
    /*!40000 ALTER TABLE `movies` DISABLE KEYS */;
    INSERT INTO `movies` VALUES (1,'Pirates of the Caribean 4',' Rob Marshall',2011,1),(2,'Forgetting Sarah Marshal','Nicholas Stoller',2008,2),(3,'X-Men',NULL,2008,NULL),(4,'Code Name Black','Edgar Jimz',2010,NULL),(5,'Daddy\'s Little Girls',NULL,2007,8),(6,'Angels and Demons',NULL,2007,6),(7,'Davinci Code',NULL,2007,6),(9,'Honey mooners','John Schultz',2005,8),(16,'67% Guilty',NULL,2012,NULL);
    /*!40000 ALTER TABLE `movies` ENABLE KEYS */;
    UNLOCK TABLES;
    
    --
    -- Table structure for table `payments`
    --
    
    DROP TABLE IF EXISTS `payments`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `payments` (
      `payment_id` int(11) NOT NULL AUTO_INCREMENT,
      `membership_number` int(11) DEFAULT NULL,
      `payment_date` date DEFAULT NULL,
      `description` varchar(75) DEFAULT NULL,
      `amount_paid` float DEFAULT NULL,
      `external_reference_number` int(11) DEFAULT NULL,
      PRIMARY KEY (`payment_id`),
      KEY `fk_Payments_Members1` (`membership_number`),
      CONSTRAINT `fk_Payments_Members1` FOREIGN KEY (`membership_number`) REFERENCES `members` (`membership_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
    
    --
    -- Dumping data for table `payments`
    --
    
    LOCK TABLES `payments` WRITE;
    /*!40000 ALTER TABLE `payments` DISABLE KEYS */;
    INSERT INTO `payments` VALUES (1,1,'2012-07-23','Movie rental payment',2500,11),(2,1,'2012-07-25','Movie rental payment',2000,12),(3,3,'2012-07-30','Movie rental payment',6000,NULL);
    /*!40000 ALTER TABLE `payments` ENABLE KEYS */;
    UNLOCK TABLES;
    
    --
    -- Table structure for table `members`
    --
    
    DROP TABLE IF EXISTS `members`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `members` (
      `membership_number` int(11) NOT NULL AUTO_INCREMENT,
      `full_names` varchar(350) NOT NULL,
      `gender` varchar(6) DEFAULT NULL,
      `date_of_birth` date DEFAULT NULL,
      `physical_address` varchar(255) DEFAULT NULL,
      `postal_address` varchar(255) DEFAULT NULL,
      `contact_number` varchar(75) DEFAULT NULL,
      `email` varchar(255) DEFAULT NULL,
      PRIMARY KEY (`membership_number`)
    ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
    
    --
    -- Dumping data for table `members`
    --
    
    LOCK TABLES `members` WRITE;
    /*!40000 ALTER TABLE `members` DISABLE KEYS */;
    INSERT INTO `members` VALUES (1,'Janet Jones','Female','1980-07-21','First Street Plot No 4','Private Bag','0759 253 542','janetjones@yagoo.cm'),(2,'Janet Smith Jones','Female','1980-06-23','Melrose 123',NULL,NULL,'jj@fstreet.com'),(3,'Robert Phil','Male','1989-07-12','3rd Street 34',NULL,'12345','rm@tstreet.com'),(4,'Gloria Williams','Female','1984-02-14','2nd Street 23',NULL,NULL,NULL);
    /*!40000 ALTER TABLE `members` ENABLE KEYS */;
    UNLOCK TABLES;
    
    --
    -- Temporary table structure for view `accounts_v_members`
    --
    
    DROP TABLE IF EXISTS `accounts_v_members`;
    /*!50001 DROP VIEW IF EXISTS `accounts_v_members`*/;
    SET @saved_cs_client     = @@character_set_client;
    SET character_set_client = utf8;
    /*!50001 CREATE TABLE `accounts_v_members` (
      `membership_number` int(11),
      `full_names` varchar(350),
      `gender` varchar(6)
    ) ENGINE=MyISAM */;
    SET character_set_client = @saved_cs_client;
    
    --
    -- Temporary table structure for view `general_v_movie_rentals`
    --
    
    DROP TABLE IF EXISTS `general_v_movie_rentals`;
    /*!50001 DROP VIEW IF EXISTS `general_v_movie_rentals`*/;
    SET @saved_cs_client     = @@character_set_client;
    SET character_set_client = utf8;
    /*!50001 CREATE TABLE `general_v_movie_rentals` (
      `membership_number` int(11),
      `full_names` varchar(350),
      `title` varchar(300),
      `transaction_date` date,
      `return_date` date
    ) ENGINE=MyISAM */;
    SET character_set_client = @saved_cs_client;
    
    --
    -- Table structure for table `categories`
    --
    
    DROP TABLE IF EXISTS `categories`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `categories` (
      `category_id` int(11) NOT NULL AUTO_INCREMENT,
      `category_name` varchar(150) DEFAULT NULL,
      `remarks` varchar(500) DEFAULT NULL,
      PRIMARY KEY (`category_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
    
    --
    -- Dumping data for table `categories`
    --
    
    LOCK TABLES `categories` WRITE;
    /*!40000 ALTER TABLE `categories` DISABLE KEYS */;
    INSERT INTO `categories` VALUES (1,'Comedy','Movies with humour'),(2,'Romantic','Love stories'),(3,'Epic','Story acient movies'),(4,'Horror',NULL),(5,'Science Fiction',NULL),(6,'Thriller',NULL),(7,'Action',NULL),(8,'Romantic Comedy',NULL);
    /*!40000 ALTER TABLE `categories` ENABLE KEYS */;
    UNLOCK TABLES;
    
    --
    -- Table structure for table `movierentals`
    --
    
    DROP TABLE IF EXISTS `movierentals`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `movierentals` (
      `reference_number` int(11) NOT NULL AUTO_INCREMENT,
      `transaction_date` date DEFAULT NULL,
      `return_date` date DEFAULT NULL,
      `membership_number` int(11) DEFAULT NULL,
      `movie_id` int(11) DEFAULT NULL,
      `movie_returned` bit(1) DEFAULT b'0',
      PRIMARY KEY (`reference_number`),
      KEY `fk_MovieRentals_Members1` (`membership_number`),
      KEY `fk_MovieRentals_Movies1` (`movie_id`),
      CONSTRAINT `fk_MovieRentals_Members1` FOREIGN KEY (`membership_number`) REFERENCES `members` (`membership_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
      CONSTRAINT `fk_MovieRentals_Movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
    
    --
    -- Dumping data for table `movierentals`
    --
    
    LOCK TABLES `movierentals` WRITE;
    /*!40000 ALTER TABLE `movierentals` DISABLE KEYS */;
    INSERT INTO `movierentals` VALUES (11,'2012-06-20',NULL,1,1,'\0'),(12,'2012-06-22','2012-06-25',1,2,'\0'),(13,'2012-06-22','2012-06-25',3,2,'\0'),(14,'2012-06-21','2012-06-24',2,2,'\0'),(15,'2012-06-23',NULL,3,3,'\0');
    /*!40000 ALTER TABLE `movierentals` ENABLE KEYS */;
    UNLOCK TABLES;
    
    --
    -- Final view structure for view `accounts_v_members`
    --
    
    /*!50001 DROP TABLE IF EXISTS `accounts_v_members`*/;
    /*!50001 DROP VIEW IF EXISTS `accounts_v_members`*/;
    /*!50001 SET @saved_cs_client          = @@character_set_client */;
    /*!50001 SET @saved_cs_results         = @@character_set_results */;
    /*!50001 SET @saved_col_connection     = @@collation_connection */;
    /*!50001 SET character_set_client      = utf8 */;
    /*!50001 SET character_set_results     = utf8 */;
    /*!50001 SET collation_connection      = utf8_general_ci */;
    /*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
    /*!50001 VIEW `accounts_v_members` AS select `members`.`membership_number` AS `membership_number`,`members`.`full_names` AS `full_names`,`members`.`gender` AS `gender` from `members` */;
    /*!50001 SET character_set_client      = @saved_cs_client */;
    /*!50001 SET character_set_results     = @saved_cs_results */;
    /*!50001 SET collation_connection      = @saved_col_connection */;
    
    --
    -- Final view structure for view `general_v_movie_rentals`
    --
    
    /*!50001 DROP TABLE IF EXISTS `general_v_movie_rentals`*/;
    /*!50001 DROP VIEW IF EXISTS `general_v_movie_rentals`*/;
    /*!50001 SET @saved_cs_client          = @@character_set_client */;
    /*!50001 SET @saved_cs_results         = @@character_set_results */;
    /*!50001 SET @saved_col_connection     = @@collation_connection */;
    /*!50001 SET character_set_client      = utf8 */;
    /*!50001 SET character_set_results     = utf8 */;
    /*!50001 SET collation_connection      = utf8_general_ci */;
    /*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
    /*!50001 VIEW `general_v_movie_rentals` AS select `mb`.`membership_number` AS `membership_number`,`mb`.`full_names` AS `full_names`,`mo`.`title` AS `title`,`mr`.`transaction_date` AS `transaction_date`,`mr`.`return_date` AS `return_date` from ((`movierentals` `mr` join `members` `mb` on((`mr`.`membership_number` = `mb`.`membership_number`))) join `movies` `mo` on((`mr`.`movie_id` = `mo`.`movie_id`))) */;
    /*!50001 SET character_set_client      = @saved_cs_client */;
    /*!50001 SET character_set_results     = @saved_cs_results */;
    /*!50001 SET collation_connection      = @saved_col_connection */;
    /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
    
    /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
    /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
    /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
    /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
    /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
    /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
    /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
    
    -- Dump completed on 2012-08-07 18:37:36
    ```
  - Now clcik on Execute button.
    ![1022](https://github.com/user-attachments/assets/7e360b6f-725a-490f-a1bb-f87530b4642d)

    
  - Now we can connect through Linux Servers, for that we will launch the Ubuntu server
    ![1011](https://github.com/user-attachments/assets/c5a21565-5300-4254-90aa-9ad77b2721d6)

    ```
    apt install python3 -y
    apt install python3-pip -y
    ```
  - After installing the ```python``` and ```python3-pip``` check the versions.
    ```
    python3 -V
    pip --version
    ```
    ```
    root@ip-10-1-1-91:~# python3 -V
    Python 3.12.3
    root@ip-10-1-1-91:~# pip --version
    pip 24.0 from /usr/lib/python3/dist-packages/pip (python 3.12)
    ```

  - Now INstall the following.
    ```
    apt install python3-fastapi -y
    apt install python3-uvicorn -y
    apt install python3-pymysql -y
    apt install python3-sqlalchemy -y
    ```
  - Now we write a code in python.
    ### demo.py
    ```
    import sqlalchemy as sal
    import pymysql
    from fastapi import FastAPI
    import uvicorn
    
    app = FastAPI()
    
    @app.get("/")
    def home():
        return "WELCOME MESSAGE"
    ```

    ### Running demo.py
    ```
    uvicorn demo:app --port 8080 --host 0.0.0.0 --reload
    ```

    ### OutPut:
    ```
    root@ip-10-1-1-91:~# uvicorn demo:app --port 8080 --host 0.0.0.0 --reload
    INFO:     Will watch for changes in these directories: ['/root']
    INFO:     Uvicorn running on http://0.0.0.0:8080 (Press CTRL+C to quit)
    INFO:     Started reloader process [18308] using StatReload
    INFO:     Started server process [18310]
    INFO:     Waiting for application startup.
    INFO:     Application startup complete.
    ```
    ![1023](https://github.com/user-attachments/assets/7c2aa32a-770d-4223-8609-c0d1eacbb4d9)

  - Now browse with below url
    ```
    http://34.207.96.253:8080
    ```
    ![1024](https://github.com/user-attachments/assets/739ebb85-5748-454e-a9e1-8dadb847fcd6)

  - After ping once in browser
    ![1025](https://github.com/user-attachments/assets/2157ebf4-1f7b-4483-bc88-739eb1c2c446)

  - Now
    ### demo.py
    ```
    import sqlalchemy as sal
    import pymysql
    from fastapi import FastAPI
    import uvicorn
    
    app = FastAPI()
    
    @app.get("/")
    def home():
        return "WELCOME MESSAGE"
    
    @app.get("/movies")
    def movies():
        db = pymysql.connect(host="demoapp-database-1.cxia00csqptb.us-east-1.rds.amazonaws.com", user = "admin", passwor                                                                                               d="MyAWSPwd1201")
        cursor = db.cursor()
        cursor.execute("select version()")
        data = cursor.fetchone()
        sql = '''use myflixdb'''
        cursor.execute(sql)
        sql = '''select * from movies'''
        cursor.execute(sql)
        data = cursor.fetchall()
        all_movies = [item for item in data]
        return all_movies
    ```
  - here in the above code change the RDS endpoint name and ID, Password.
    ### Running demo.py
    ```
    uvicorn demo:app --port 8080 --host 0.0.0.0 --reload
    ```
  - Now browse in Browser
    ```
    http://34.207.96.253:8080
    http://34.207.96.253:8080/docs
    ```
    ![1026](https://github.com/user-attachments/assets/c5ca4d25-33fc-4275-9c53-70dca4f1d6ea)

  - Now we will do failover of RDS.
    ![1027](https://github.com/user-attachments/assets/8aef6889-f263-4eee-89fd-46e3b8cb5007)
    ![1028](https://github.com/user-attachments/assets/fddc7185-a280-4139-950d-b68c8a8cbcc1)
    ### app.py
    ```
    import sqlalchemy as sal
    import pymysql
    db = pymysql.connect(host="awsb45-database-instance.c7khegicx1do.us-east-1.rds.amazonaws.com", user = "admin", password="India123456")
    cursor = db.cursor()
    cursor.execute("select version()")
    data = cursor.fetchone()
    sql = '''use myflixdb'''
    cursor.execute(sql)
    sql = '''select * from movies'''
    cursor.execute(sql)
    data = cursor.fetchall()
    for item in data:
      print(item)
    ```
    ```
    watch python3 app.py
    ```
    ![1029](https://github.com/user-attachments/assets/5e1cae08-d184-4316-b0b4-842e842e3b44)

    ```
    nslookup demoapp-database-1.cxia00csqptb.us-east-1.rds.amazonaws.com
    ```
    ![1030](https://github.com/user-attachments/assets/8787bec7-c77f-46ff-bc86-d8b936eabc44)
    ![1031](https://github.com/user-attachments/assets/8b1c705b-b15a-45f6-b1db-a8bdd2bfa1df)
