CREATE TABLE IF NOT EXISTS `MIROSdb`.`Manager` (
  `managerID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`managerID`))
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `MIROSdb`.`SuperVisor` (
  `SuperVisorid` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `points` INT NOT NULL,
  `managerID` INT NOT NULL,
  PRIMARY KEY (`SuperVisorid`),
  INDEX `ManagerID_idx` (`managerID` ASC) VISIBLE,
  CONSTRAINT `ManagerID`
    FOREIGN KEY (`managerID`)
    REFERENCES `MIROSdb`.`Manager` (`managerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `MIROSdb`.`ResearchOfficer` (
  `officerID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `supervisorID` INT NULL,
  `points` INT NULL,
  PRIMARY KEY (`officerID`),
  INDEX `supervisorID_idx` (`supervisorID` ASC) VISIBLE,
  CONSTRAINT `supervisorID`
    FOREIGN KEY (`supervisorID`)
    REFERENCES `MIROSdb`.`SuperVisor` (`SuperVisorid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `MIROSdb`.`Submission` (
  `submissionID` INT NOT NULL,
  `officerID` INT NULL,
  `supervisorID` INT NULL,
  `fileID` INT NULL,
  `Section` VARCHAR(45) NULL,
  `Item` VARCHAR(45) NULL,
  `Date_Uploaded` DATE NULL,
  `Approved` TINYINT NULL,
  PRIMARY KEY (`submissionID`),
  INDEX `officerID_idx` (`officerID` ASC) VISIBLE,
  INDEX `supervisorID_idx` (`supervisorID` ASC) VISIBLE,
  CONSTRAINT `officerID`
    FOREIGN KEY (`officerID`)
    REFERENCES `MIROSdb`.`ResearchOfficer` (`officerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `supervisorID`
    FOREIGN KEY (`supervisorID`)
    REFERENCES `MIROSdb`.`SuperVisor` (`SuperVisorid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB