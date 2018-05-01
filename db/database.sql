#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE if exists blissful_morning;
CREATE DATABASE if not exists blissful_morning;
#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        user_id   int (11) Auto_increment  NOT NULL ,
        name      Varchar (100) NOT NULL ,
        signed_up Date NOT NULL ,
        PRIMARY KEY (user_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: activity
#------------------------------------------------------------

CREATE TABLE activity(
        activity_id int (11) Auto_increment  NOT NULL ,
        name        Varchar (200) NOT NULL ,
        description Varchar (400) ,
        duration    Time ,
        user_id     Int NULL ,
        PRIMARY KEY (activity_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: routine
#------------------------------------------------------------

CREATE TABLE routine(
        routine_id int (11) Auto_increment  NOT NULL ,
        name       Varchar (100) NOT NULL ,
        user_id    Int NULL ,
        PRIMARY KEY (routine_id ) ,
        UNIQUE (name )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: affirmation
#------------------------------------------------------------

CREATE TABLE affirmation(
        affirmation_id   int (11) Auto_increment  NOT NULL ,
        affirmation_text Varchar (400) NOT NULL ,
        PRIMARY KEY (affirmation_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: motivation
#------------------------------------------------------------

CREATE TABLE motivation(
        motivation_id   int (11) Auto_increment  NOT NULL ,
        motivation_text Varchar (400) NOT NULL ,
        PRIMARY KEY (motivation_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contain
#------------------------------------------------------------

CREATE TABLE contain(
        position    Int NOT NULL ,
        routine_id  Int NOT NULL ,
        activity_id Int NOT NULL ,
        PRIMARY KEY (routine_id ,activity_id )
)ENGINE=InnoDB;

ALTER TABLE activity ADD CONSTRAINT FK_activity_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE routine ADD CONSTRAINT FK_routine_user_id FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE contain ADD CONSTRAINT FK_contain_routine_id FOREIGN KEY (routine_id) REFERENCES routine(routine_id);
ALTER TABLE contain ADD CONSTRAINT FK_contain_activity_id FOREIGN KEY (activity_id) REFERENCES activity(activity_id);
