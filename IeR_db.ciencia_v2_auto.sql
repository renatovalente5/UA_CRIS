
CREATE TABLE ClassificationScheme (
                ClassificationSchemeId INT IDENTITY NOT NULL,
                Name VARCHAR(255) NOT NULL,
                ClassSchemeUUID VARCHAR(32) NOT NULL,
                Owner CHAR(2) NOT NULL,
                CONSTRAINT ClassificationSchemeId PRIMARY KEY (ClassificationSchemeId)
)

CREATE TABLE Visibility (
                VisibilityId INT NOT NULL,
                Term VARCHAR(50) NOT NULL,
                CONSTRAINT VisibilityId PRIMARY KEY (VisibilityId)
)

CREATE TABLE Citation (
                CitationId INT IDENTITY NOT NULL,
                URI VARCHAR(128),
                CONSTRAINT CitationId PRIMARY KEY (CitationId)
)

CREATE TABLE CV (
                CVId INT IDENTITY NOT NULL,
                CVDoc TEXT,
                URI VARCHAR(128),
                CONSTRAINT CVId PRIMARY KEY (CVId)
)

CREATE TABLE ExpSkills (
                ExpSkillsId INT IDENTITY NOT NULL,
                URI VARCHAR(128),
                CONSTRAINT ExpSkillsId PRIMARY KEY (ExpSkillsId)
)

CREATE TABLE Qualification (
                QualificationId INT IDENTITY NOT NULL,
                URI VARCHAR(128),
                CONSTRAINT QualificationId PRIMARY KEY (QualificationId)
)

CREATE TABLE Service (
                ServiceId INT IDENTITY NOT NULL,
                Acronym VARCHAR(16),
                URI VARCHAR(128),
                CONSTRAINT ServiceId PRIMARY KEY (ServiceId)
)

CREATE TABLE Equipment (
                EquipmentId INT IDENTITY NOT NULL,
                Acronym VARCHAR(16),
                URI VARCHAR(128),
                CONSTRAINT EquipmentId PRIMARY KEY (EquipmentId)
)

CREATE TABLE Prize (
                PrizeId INT IDENTITY NOT NULL,
                URI VARCHAR(128),
                CONSTRAINT PrizeId PRIMARY KEY (PrizeId)
)

CREATE TABLE Medium (
                MediumId INT IDENTITY NOT NULL,
                CreationDate DATETIME,
                Size FLOAT,
                MimeType VARCHAR(30),
                URI VARCHAR(128),
                CONSTRAINT MediumId PRIMARY KEY (MediumId)
)

CREATE TABLE Currency (
                CurrencyId INT IDENTITY NOT NULL,
                Code VARCHAR(3) NOT NULL,
                CONSTRAINT CurrencyId PRIMARY KEY (CurrencyId)
)

CREATE TABLE Funding (
                FundingId INT IDENTITY NOT NULL,
                CurrencyId INT NOT NULL,
                StartDate DATETIME,
                EndDate DATETIME,
                Acronym VARCHAR(16),
                Amount FLOAT,
                URI VARCHAR(128),
                CONSTRAINT FundingId PRIMARY KEY (FundingId)
)

CREATE TABLE Project (
                ProjectId INT IDENTITY NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Acronym VARCHAR(16) NOT NULL,
                URI VARCHAR(128),
                CONSTRAINT ProjectId PRIMARY KEY (ProjectId)
)

CREATE TABLE Classification (
                ClassificationId INT IDENTITY NOT NULL,
                Term VARCHAR(255) NOT NULL,
                ClassUUID VARCHAR(32) NOT NULL,
                CONSTRAINT ClassificationId PRIMARY KEY (ClassificationId)
)

CREATE TABLE Equipment_Service (
                EquipmentId INT NOT NULL,
                ServiceId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EquipmentId, ServiceId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Service_Funding (
                ServiceId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CurrencyId INT NOT NULL,
                Amount FLOAT,
                CONSTRAINT id PRIMARY KEY (ServiceId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Service_Medium (
                ServiceId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ServiceId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Service_Service (
                ServiceId1 INT NOT NULL,
                ServiceId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ServiceId1, ServiceId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Service_Classification (
                ServiceId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ServiceId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Funding_Prize (
                FundingId INT NOT NULL,
                PrizeId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (FundingId, PrizeId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Prize (
                ProjectId INT NOT NULL,
                PrizeId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                PrizeDate DATETIME,
                CONSTRAINT id PRIMARY KEY (ProjectId, PrizeId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Prize_Classification (
                PrizeId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PrizeId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Equipment_Medium (
                EquipmentId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EquipmentId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Equipment_Funding (
                EquipmentId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CurrencyId INT NOT NULL,
                Amount FLOAT,
                CONSTRAINT id PRIMARY KEY (EquipmentId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Equipment_Equipment (
                EquipmentId1 INT NOT NULL,
                EquipmentId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EquipmentId1, EquipmentId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Equipment (
                ProjectId INT NOT NULL,
                EquipmentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProjectId, EquipmentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Equipment_Classification (
                EquipmentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EquipmentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Citation_Classification (
                CitationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (CitationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Medium_Classification (
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Medium_Funding (
                MediumId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (MediumId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Medium (
                ProjectId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProjectId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Funding_Funding (
                FundingId1 INT NOT NULL,
                FundingId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (FundingId1, FundingId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Funding_Classification (
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE ExpSkills_Classification (
                ExpSkillsId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ExpSkillsId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Qualification_Classification (
                QualificationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (QualificationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Project (
                ProjectId1 INT NOT NULL,
                ProjectId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate INT NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT Project_ProjectId PRIMARY KEY (ProjectId1, ProjectId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Funding (
                ProjectId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (ProjectId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE CV_CVClassification (
                CVId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (CVId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Classification_ClassificationScheme (
                ClassificationId INT NOT NULL,
                ClassificationSchemeId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (ClassificationId, ClassificationSchemeId)
)

CREATE TABLE Project_Classification (
                ProjectId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT DEFAULT 1,
                CONSTRAINT id PRIMARY KEY (ProjectId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Country (
                CountryId INT IDENTITY NOT NULL,
                Code CHAR(2) NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT CountryId PRIMARY KEY (CountryId)
)

CREATE TABLE Event (
                EventId INT IDENTITY NOT NULL,
                City VARCHAR(30),
                CountryId INT NOT NULL,
                StartDate DATETIME,
                EndDate DATETIME,
                URI VARCHAR(128) NOT NULL,
                CONSTRAINT EventId PRIMARY KEY (EventId)
)

CREATE TABLE Event_Medium (
                EventId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EventId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Event (
                ProjectId INT NOT NULL,
                EventId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProjectId, EventId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Event_Funding (
                EventId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (EventId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Event_Event (
                EventId1 INT NOT NULL,
                EventId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EventId1, EventId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Event_Classification (
                EventId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (EventId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Patent (
                PatentId INT IDENTITY NOT NULL,
                CountryId INT NOT NULL,
                RegisterDate DATETIME NOT NULL,
                ApprovDate DATETIME NOT NULL,
                Number VARCHAR(64) NOT NULL,
                URI VARCHAR(128),
                CONSTRAINT PatentId PRIMARY KEY (PatentId)
)

CREATE TABLE Patent_Medium (
                PatentId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PatentId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Patent_Funding (
                PatentId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT NOT NULL,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PatentId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Patent (
                ProjectId INT NOT NULL,
                PatentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT NOT NULL,
                CONSTRAINT id PRIMARY KEY (ProjectId, PatentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Patent_Patent (
                PatentId1 INT NOT NULL,
                PatentId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PatentId1, PatentId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Patent_Classification (
                PatentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PatentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE PAddress (
                PAddressId INT IDENTITY NOT NULL,
                Line1 VARCHAR(255) NOT NULL,
                Line2 VARCHAR(255),
                Line3 VARCHAR(255),
                PostCode VARCHAR(32),
                CityTown VARCHAR(50),
                StateOfCountry VARCHAR(128),
                CountryId INT NOT NULL,
                CONSTRAINT PAddressId PRIMARY KEY (PAddressId)
)

CREATE TABLE EAddressType (
                EAddressTypeId INT IDENTITY NOT NULL,
                Term VARCHAR(255) NOT NULL,
                ClassificationId INT NOT NULL,
                CONSTRAINT EAddressTypeId PRIMARY KEY (EAddressTypeId)
)

CREATE TABLE EAddress (
                EAddressId INT IDENTITY NOT NULL,
                Uri VARCHAR(255) NOT NULL,
                EAddressTypeId INT NOT NULL,
                CONSTRAINT EAddressId PRIMARY KEY (EAddressId)
)

CREATE TABLE Identifier (
                IdentifierId INT IDENTITY NOT NULL,
                Term VARCHAR(255) NOT NULL,
                ClassificationId INT NOT NULL,
                CONSTRAINT IdentifierId PRIMARY KEY (IdentifierId)
)

CREATE TABLE Identifier_Classification (
                IdentifierId INT NOT NULL,
                ClassificationId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (IdentifierId, ClassificationId)
)

CREATE TABLE PersonGender (
                GenderId INT IDENTITY NOT NULL,
                Term VARCHAR(50) NOT NULL,
                CONSTRAINT PersonGenderId PRIMARY KEY (GenderId)
)

CREATE TABLE Person (
                PersonID INT IDENTITY NOT NULL,
                BirthDate DATETIME,
                GenderId INT NOT NULL,
                Photo VARCHAR(255),
                CONSTRAINT PersonId PRIMARY KEY (PersonID)
)

CREATE TABLE Person_CV (
                PersonID INT NOT NULL,
                CVId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, CVId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_ExpSkills (
                PersonID INT NOT NULL,
                ExpSkillsId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, ExpSkillsId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Qualification (
                PersonID INT NOT NULL,
                QualificationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, QualificationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Service (
                PersonID INT NOT NULL,
                ServiceId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, ServiceId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Prize (
                PersonID INT NOT NULL,
                PrizeId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, PrizeId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Medium (
                PersonID INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Event (
                PersonID INT NOT NULL,
                EventId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, EventId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Funding (
                PersonID INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Patent (
                PersonID INT NOT NULL,
                PatentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Order_1 INT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, PatentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Person (
                ProjectId INT NOT NULL,
                PersonID INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT Project_PersonId PRIMARY KEY (ProjectId, PersonID, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Person (
                PersonID1 INT NOT NULL,
                PersonID2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                VisibilityId INT NOT NULL,
                CONSTRAINT Person_PersonId PRIMARY KEY (PersonID1, PersonID2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_EAddress (
                PersonID INT NOT NULL,
                EAddressId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT Person_EAddressId PRIMARY KEY (PersonID, EAddressId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_PAddress (
                PersonID INT NOT NULL,
                PAddressId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT Person_PAddressId PRIMARY KEY (PersonID, PAddressId, StartDate, EndDate)
)

CREATE TABLE Person_Identifier (
                PersonID INT NOT NULL,
                IdentifierId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Value VARCHAR(128) NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT Person_IdentifierId PRIMARY KEY (PersonID, IdentifierId, StartDate, EndDate)
)

CREATE TABLE PersonName (
                PersonNameId INT IDENTITY NOT NULL,
                PersonID INT NOT NULL,
                Name VARCHAR(500) NOT NULL,
                ClassificationId INT NOT NULL,
                EndDate DATETIME,
                StartDate DATETIME,
                CONSTRAINT PersonNameId PRIMARY KEY (PersonNameId)
)

CREATE TABLE Language (
                LanguageId INT IDENTITY NOT NULL,
                Acronym VARCHAR(5) NOT NULL,
                Description VARCHAR(255) NOT NULL,
                CONSTRAINT LanguageId PRIMARY KEY (LanguageId)
)

CREATE TABLE Product (
                ProductId INT IDENTITY NOT NULL,
                URI VARCHAR(128),
                LanguageId INT NOT NULL,
                Date DATETIME NOT NULL,
                CONSTRAINT ProductId PRIMARY KEY (ProductId)
)

CREATE TABLE Product_Identifier (
                ProductId INT NOT NULL,
                IdentifierId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Value VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (ProductId, IdentifierId, StartDate, EndDate)
)

CREATE TABLE Product_Service (
                ProductId INT NOT NULL,
                ServiceId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProductId, ServiceId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Product_Equipment (
                ProductId INT NOT NULL,
                EquipmentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProductId, EquipmentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Product_Medium (
                ProductId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProductId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Product_Funding (
                ProductId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (ProductId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Product (
                ProjectId INT NOT NULL,
                ProductId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProjectId, ProductId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Product (
                PersonID INT NOT NULL,
                ProductId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Conditions VARCHAR(255),
                Availability VARCHAR(64),
                CurrencyId INT NOT NULL,
                Price FLOAT,
                IPR VARCHAR(64),
                Order_1 INT,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, ProductId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Product_Patent (
                ProductId INT NOT NULL,
                PatentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProductId, PatentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Product_Classification (
                ProductId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProductId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Product_Product (
                ProductId1 INT NOT NULL,
                ProductId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate INT NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProductId1, ProductId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication (
                PublicationId INT IDENTITY NOT NULL,
                Date DATETIME NOT NULL,
                Source VARCHAR(255) NOT NULL,
                Synced BIT NOT NULL,
                LanguageId INT NOT NULL,
                CONSTRAINT PublicationId PRIMARY KEY (PublicationId)
)

CREATE TABLE Publication_Identifier (
                PublicationId INT NOT NULL,
                IdentifierId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Value VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, IdentifierId, StartDate, EndDate)
)

CREATE TABLE Publication_Prize (
                PublicationId INT NOT NULL,
                PrizeId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId, PrizeId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Citation (
                PublicationId INT NOT NULL,
                CitationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Year INT NOT NULL,
                Count FLOAT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, CitationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Medium (
                PublicationId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Event (
                PublicationId INT NOT NULL,
                EventId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId, EventId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Funding (
                PublicationId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT NOT NULL,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Product (
                PublicationId INT NOT NULL,
                ProductId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId, ProductId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Patent (
                PublicationId INT NOT NULL,
                PatentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId, PatentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_Publication (
                ProjectId INT NOT NULL,
                PublicationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (ProjectId, PublicationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_Publication (
                PersonID INT NOT NULL,
                PublicationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Order_1 INT,
                Copyright VARCHAR(64),
                PersonNameId INT NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, PublicationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Publication (
                PublicationId1 INT NOT NULL,
                PublicationId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId1, PublicationId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Publication_Classification (
                PublicationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (PublicationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE PublicationDetail (
                PublicationId INT NOT NULL,
                Number VARCHAR(32),
                Volume VARCHAR(3),
                Edition VARCHAR(8),
                Series VARCHAR(8),
                Issue VARCHAR(8),
                StartPage VARCHAR(8),
                EndPage VARCHAR(8),
                TotalPages VARCHAR(8),
                ISBN VARCHAR(20),
                ISSN VARCHAR(16),
                URI VARCHAR(128),
                CONSTRAINT PublicationId PRIMARY KEY (PublicationId)
)

CREATE TABLE Person_Language (
                PersonID INT NOT NULL,
                LanguageId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                SkillReading CHAR(1) NOT NULL,
                SkillSpeaking CHAR(1) NOT NULL,
                SkillWriting CHAR(1) NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PersonID, LanguageId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE CitationDescription (
                CitationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (CitationId, LanguageId)
)

CREATE TABLE CitationTitle (
                CitationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Title VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (CitationId, LanguageId)
)

CREATE TABLE ExpSkillsKeywords (
                ExpSkillsId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (ExpSkillsId, LanguageId)
)

CREATE TABLE ExpSkillsDescription (
                ExpSkillsId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (ExpSkillsId, LanguageId)
)

CREATE TABLE ExpSkillsName (
                ExpSkillsId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (ExpSkillsId, LanguageId)
)

CREATE TABLE QualificationTitle (
                QualificationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Title VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (QualificationId, LanguageId)
)

CREATE TABLE QualificationKeywords (
                QualificationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (QualificationId, LanguageId)
)

CREATE TABLE QualificationDescription (
                QualificationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (QualificationId, LanguageId)
)

CREATE TABLE ServiceKeywords (
                ServiceId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (ServiceId, LanguageId)
)

CREATE TABLE ServiceDescription (
                ServiceId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (ServiceId, LanguageId)
)

CREATE TABLE ServiceName (
                ServiceId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (ServiceId, LanguageId)
)

CREATE TABLE EquipmentKeywords (
                EquipmentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (EquipmentId, LanguageId)
)

CREATE TABLE EquipmentDescription (
                EquipmentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (EquipmentId, LanguageId)
)

CREATE TABLE EquipmentName (
                EquipmentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (EquipmentId, LanguageId)
)

CREATE TABLE PrizeKeywords (
                PrizeId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PrizeId, LanguageId)
)

CREATE TABLE PrizeDescription (
                PrizeId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PrizeId, LanguageId)
)

CREATE TABLE PrizeName (
                PrizeId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PrizeId, LanguageId)
)

CREATE TABLE MediumKeywords (
                MediumId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (MediumId, LanguageId)
)

CREATE TABLE MediumDescription (
                MediumId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (MediumId, LanguageId)
)

CREATE TABLE MediumTitle (
                MediumId INT NOT NULL,
                LanguageId INT NOT NULL,
                Title VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (MediumId, LanguageId)
)

CREATE TABLE EventKeywords (
                EventId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (EventId, LanguageId)
)

CREATE TABLE EventName (
                EventId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (EventId, LanguageId)
)

CREATE TABLE EventDescription (
                EventId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (EventId, LanguageId)
)

CREATE TABLE FundingDescription (
                FundingId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (FundingId, LanguageId)
)

CREATE TABLE FundingKeywords (
                FundingId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (FundingId, LanguageId)
)

CREATE TABLE FundingName (
                FundingId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (FundingId, LanguageId)
)

CREATE TABLE CurrencyName (
                CurrencyId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(64) NOT NULL,
                CONSTRAINT id PRIMARY KEY (CurrencyId, LanguageId)
)

CREATE TABLE ProductVersion (
                ProductId INT NOT NULL,
                LanguageId INT NOT NULL,
                Version VARCHAR(255) NOT NULL,
                CONSTRAINT ProductVersionId PRIMARY KEY (ProductId, LanguageId)
)

CREATE TABLE ProductKeywords (
                ProductId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT ProductKeywordsId PRIMARY KEY (ProductId, LanguageId)
)

CREATE TABLE ProductDescription (
                ProductId INT NOT NULL,
                LanguageId INT NOT NULL,
                Description TEXT NOT NULL,
                CONSTRAINT ProductDescriptionId PRIMARY KEY (ProductId, LanguageId)
)

CREATE TABLE ProductAltName (
                ProductId INT NOT NULL,
                LanguageId INT NOT NULL,
                AltName NVARCHAR(255) NOT NULL,
                CONSTRAINT ProductAltNameId PRIMARY KEY (ProductId, LanguageId)
)

CREATE TABLE ProductName (
                ProductId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(255) NOT NULL,
                CONSTRAINT ProductNameId PRIMARY KEY (ProductId, LanguageId)
)

CREATE TABLE PatentVersion (
                PatentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Version VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PatentId, LanguageId)
)

CREATE TABLE PatentKeywords (
                PatentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PatentId, LanguageId)
)

CREATE TABLE PatentAbstract (
                PatentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Abstract TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PatentId, LanguageId)
)

CREATE TABLE PatentTitle (
                PatentId INT NOT NULL,
                LanguageId INT NOT NULL,
                Title VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PatentId, LanguageId)
)

CREATE TABLE PublicationVersion (
                PublicationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Version VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, LanguageId)
)

CREATE TABLE PublicationKeywords (
                PublicationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, LanguageId)
)

CREATE TABLE PublicationAbstract (
                PublicationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Abstract TEXT NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, LanguageId)
)

CREATE TABLE PublicationSubtitle (
                PublicationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Subtitle VARCHAR(255) NOT NULL,
                CONSTRAINT id PRIMARY KEY (PublicationId, LanguageId)
)

CREATE TABLE PublicationTitle (
                PublicationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Title VARCHAR(255) NOT NULL,
                CONSTRAINT PublicationTitleId PRIMARY KEY (PublicationId, LanguageId)
)

CREATE TABLE ProjectKeywords (
                ProjectId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords VARCHAR(255) NOT NULL,
                CONSTRAINT ProjectKeywords PRIMARY KEY (ProjectId, LanguageId)
)

CREATE TABLE ProjectAbstract (
                ProjectId INT NOT NULL,
                LanguageId INT NOT NULL,
                Abstract TEXT NOT NULL,
                CONSTRAINT ProjectAbstract PRIMARY KEY (ProjectId, LanguageId)
)

CREATE TABLE ProjectTitle (
                ProjectId INT NOT NULL,
                LanguageId INT NOT NULL,
                Title VARCHAR(255) NOT NULL,
                CONSTRAINT ProjectTitleId PRIMARY KEY (ProjectId, LanguageId)
)

CREATE TABLE Classification_Language (
                ClassificationId INT NOT NULL,
                LanguageId INT NOT NULL,
                Term VARCHAR(255) NOT NULL,
                CONSTRAINT Class_Lang_Id PRIMARY KEY (ClassificationId, LanguageId)
)

CREATE TABLE PersonResearchInterests (
                PersonID INT NOT NULL,
                LanguageId INT NOT NULL,
                Terms TEXT NOT NULL,
                CONSTRAINT PersonResearchInterestsId PRIMARY KEY (PersonID, LanguageId)
)

CREATE TABLE PersonKeywords (
                PersonID INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords TEXT NOT NULL,
                CONSTRAINT PersonKeywordsId PRIMARY KEY (PersonID, LanguageId)
)

CREATE TABLE Gender_Language (
                GenderId INT NOT NULL,
                LanguageId INT NOT NULL,
                Term VARCHAR(50) NOT NULL,
                CONSTRAINT id PRIMARY KEY (GenderId, LanguageId)
)

CREATE TABLE OrgUnit (
                OrgUnitId INT NOT NULL,
                Acronym VARCHAR(50),
                URI VARCHAR(128) NOT NULL,
                CONSTRAINT OrgUnitId PRIMARY KEY (OrgUnitId)
)

CREATE TABLE OrgUnit_Classification (
                OrgUnitId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_ExpSkills (
                OrgUnitId INT NOT NULL,
                ExpSkillsId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, ExpSkillsId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Service (
                OrgUnitId INT NOT NULL,
                ServiceId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, ServiceId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Equipment (
                OrgUnitId INT NOT NULL,
                EquipmentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, EquipmentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Prize (
                OrgUnitId INT NOT NULL,
                PrizeId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, PrizeId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Medium (
                OrgUnitId INT NOT NULL,
                MediumId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, MediumId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Event (
                OrgUnitId INT NOT NULL,
                EventId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, EventId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Identifier (
                OrgUnitId INT NOT NULL,
                IdentifierId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Value VARCHAR(128) NOT NULL,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, IdentifierId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Funding (
                OrgUnitId INT NOT NULL,
                FundingId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Amount FLOAT,
                CurrencyId INT NOT NULL,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, FundingId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Product (
                OrgUnitId INT NOT NULL,
                ProductId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Availability VARCHAR(64),
                Conditions VARCHAR(255),
                CurrencyId INT NOT NULL,
                Price FLOAT,
                Order_1 INT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, ProductId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Patent (
                OrgUnitId INT NOT NULL,
                PatentId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                Order_1 INT,
                CONSTRAINT id PRIMARY KEY (OrgUnitId, PatentId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_Publication (
                OrgUnitId INT NOT NULL,
                PublicationId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Order_1 INT,
                Fraction FLOAT,
                Copyright VARCHAR(64),
                CONSTRAINT id PRIMARY KEY (OrgUnitId, PublicationId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Project_OrgUnit (
                ProjectId INT NOT NULL,
                OrgUnitId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT Project_OrgUnitID PRIMARY KEY (ProjectId, OrgUnitId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE Person_OrgUnit (
                PersonID INT NOT NULL,
                OrgUnitId INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT DEFAULT 1 NOT NULL,
                VisibilityId INT NOT NULL,
                CONSTRAINT Person_OrgUnitId PRIMARY KEY (PersonID, OrgUnitId, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnit_PAddress (
                OrgUnitId INT NOT NULL,
                PAddressId INT NOT NULL,
                StartDate DATETIME,
                EndDate DATETIME,
                CONSTRAINT OrgUnit_PAddressId PRIMARY KEY (OrgUnitId, PAddressId)
)

CREATE TABLE OrgUnitKeywords (
                OrgUnitId INT NOT NULL,
                LanguageId INT NOT NULL,
                Keywords TEXT NOT NULL,
                CONSTRAINT OrgUnitKeywordsID PRIMARY KEY (OrgUnitId, LanguageId)
)

CREATE TABLE OrgUnitActivity (
                OrgUnitId INT NOT NULL,
                LanguageId INT NOT NULL,
                Text TEXT NOT NULL,
                CONSTRAINT OrgUnitActivityId PRIMARY KEY (OrgUnitId, LanguageId)
)

CREATE TABLE OrgUnit_OrgUnit (
                OrgUnitId1 INT NOT NULL,
                OrgUnitId2 INT NOT NULL,
                ClassificationId INT NOT NULL,
                StartDate DATETIME NOT NULL,
                EndDate DATETIME NOT NULL,
                Fraction FLOAT,
                CONSTRAINT OrgUnit_OrgUnitId PRIMARY KEY (OrgUnitId1, OrgUnitId2, ClassificationId, StartDate, EndDate)
)

CREATE TABLE OrgUnitName (
                OrgUnitId INT NOT NULL,
                LanguageId INT NOT NULL,
                Name VARCHAR(500) NOT NULL,
                CONSTRAINT OrgUnitNameId PRIMARY KEY (OrgUnitId, LanguageId)
)

ALTER TABLE Classification_ClassificationScheme ADD CONSTRAINT ClassificationScheme_Classification_ClassificationScheme_fk
FOREIGN KEY (ClassificationSchemeId)
REFERENCES ClassificationScheme (ClassificationSchemeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Language ADD CONSTRAINT Visibility_Person_Language_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Identifier ADD CONSTRAINT Visibility_Person_Identifier_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_PAddress ADD CONSTRAINT Visibility_Person_PAddress_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_EAddress ADD CONSTRAINT Visibility_Person_EAddress_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Person ADD CONSTRAINT Visibility_Person_Person_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_OrgUnit ADD CONSTRAINT Visibility_Person_OrgUnit_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Person ADD CONSTRAINT Visibility_Project_Person_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Event ADD CONSTRAINT Visibility_Person_Event_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_CV ADD CONSTRAINT Visibility_Person_CV_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Publication ADD CONSTRAINT Visibility_Person_Publication_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Patent ADD CONSTRAINT Visibility_Person_Patent_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Product ADD CONSTRAINT Visibility_Person_Product_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Funding ADD CONSTRAINT Visibility_Person_Funding_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Qualification ADD CONSTRAINT Visibility_Person_Qualification_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_ExpSkills ADD CONSTRAINT Visibility_Person_ExpSkills_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Medium ADD CONSTRAINT Visibility_Person_Medium_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Prize ADD CONSTRAINT Visibility_Person_Prize_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Service ADD CONSTRAINT Visibility_Person_Service_fk
FOREIGN KEY (VisibilityId)
REFERENCES Visibility (VisibilityId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CitationTitle ADD CONSTRAINT Citation_CitationTitle_fk
FOREIGN KEY (CitationId)
REFERENCES Citation (CitationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CitationDescription ADD CONSTRAINT Citation_CitationDescription_fk
FOREIGN KEY (CitationId)
REFERENCES Citation (CitationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Citation_Classification ADD CONSTRAINT Citation_Citation_CitationClassification_fk
FOREIGN KEY (CitationId)
REFERENCES Citation (CitationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Citation ADD CONSTRAINT Citation_Publication_Citation_fk
FOREIGN KEY (CitationId)
REFERENCES Citation (CitationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CV_CVClassification ADD CONSTRAINT CV_CV_CVClassification_fk
FOREIGN KEY (CVId)
REFERENCES CV (CVId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_CV ADD CONSTRAINT CV_Person_CV_fk
FOREIGN KEY (CVId)
REFERENCES CV (CVId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkillsName ADD CONSTRAINT ExpSkills_ExpSkillsName_fk
FOREIGN KEY (ExpSkillsId)
REFERENCES ExpSkills (ExpSkillsId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkillsDescription ADD CONSTRAINT ExpSkills_ExpSkillsDescription_fk
FOREIGN KEY (ExpSkillsId)
REFERENCES ExpSkills (ExpSkillsId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkillsKeywords ADD CONSTRAINT ExpSkills_ExpSkillsKeywords_fk
FOREIGN KEY (ExpSkillsId)
REFERENCES ExpSkills (ExpSkillsId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_ExpSkills ADD CONSTRAINT ExpSkills_OrgUnit_ExpSkills_fk
FOREIGN KEY (ExpSkillsId)
REFERENCES ExpSkills (ExpSkillsId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_ExpSkills ADD CONSTRAINT ExpSkills_Person_ExpSkills_fk
FOREIGN KEY (ExpSkillsId)
REFERENCES ExpSkills (ExpSkillsId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkills_Classification ADD CONSTRAINT ExpSkills_ExpSkills_ExpSkillsClassification_fk
FOREIGN KEY (ExpSkillsId)
REFERENCES ExpSkills (ExpSkillsId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE QualificationDescription ADD CONSTRAINT Qualification_QualificationDescription_fk
FOREIGN KEY (QualificationId)
REFERENCES Qualification (QualificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE QualificationKeywords ADD CONSTRAINT Qualification_QualificationKeywords_fk
FOREIGN KEY (QualificationId)
REFERENCES Qualification (QualificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Qualification ADD CONSTRAINT Qualification_Person_Qualification_fk
FOREIGN KEY (QualificationId)
REFERENCES Qualification (QualificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE QualificationTitle ADD CONSTRAINT Qualification_QualificationTitle_fk
FOREIGN KEY (QualificationId)
REFERENCES Qualification (QualificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Qualification_Classification ADD CONSTRAINT Qualification_Qualification_QualificationClassification_fk
FOREIGN KEY (QualificationId)
REFERENCES Qualification (QualificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ServiceName ADD CONSTRAINT Service_ServiceName_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ServiceDescription ADD CONSTRAINT Service_ServiceDescription_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ServiceKeywords ADD CONSTRAINT Service_ServiceKeywords_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Classification ADD CONSTRAINT Service_Service_ServiceClassification_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Service ADD CONSTRAINT Service_Service_Service_fk
FOREIGN KEY (ServiceId1)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Service ADD CONSTRAINT Service_Service_Service_fk1
FOREIGN KEY (ServiceId2)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Service ADD CONSTRAINT Service_OrgUnit_Service_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Service ADD CONSTRAINT Service_Person_Service_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Service ADD CONSTRAINT Service_Product_Service_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Medium ADD CONSTRAINT Service_Service_Medium_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Funding ADD CONSTRAINT Service_Service_Funding_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Service ADD CONSTRAINT Service_Equipment_Service_fk
FOREIGN KEY (ServiceId)
REFERENCES Service (ServiceId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EquipmentName ADD CONSTRAINT Equipment_EquipmentName_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EquipmentDescription ADD CONSTRAINT Equipment_EquipmentDescription_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EquipmentKeywords ADD CONSTRAINT Equipment_EquipmentKeywords_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Classification ADD CONSTRAINT Equipment_Equipment_EquipmentClassification_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Equipment ADD CONSTRAINT Equipment_Equipment_Equipment_fk
FOREIGN KEY (EquipmentId1)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Equipment ADD CONSTRAINT Equipment_Equipment_Equipment_fk1
FOREIGN KEY (EquipmentId2)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Equipment ADD CONSTRAINT Equipment_OrgUnit_Equipment_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Equipment ADD CONSTRAINT Equipment_Project_Equipment_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Equipment ADD CONSTRAINT Equipment_Product_Equipment_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Funding ADD CONSTRAINT Equipment_Equipment_Funding_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Medium ADD CONSTRAINT Equipment_Equipment_Medium_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Service ADD CONSTRAINT Equipment_Equipment_Service_fk
FOREIGN KEY (EquipmentId)
REFERENCES Equipment (EquipmentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PrizeName ADD CONSTRAINT Prize_PrizeName_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PrizeDescription ADD CONSTRAINT Prize_PrizeDescription_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PrizeKeywords ADD CONSTRAINT Prize_PrizeKeywords_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Prize_Classification ADD CONSTRAINT Prize_Prize_PrizeClassification_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Prize ADD CONSTRAINT Prize_Project_Prize_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Prize ADD CONSTRAINT Prize_Person_Prize_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Prize ADD CONSTRAINT Prize_OrgUnit_Prize_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Prize ADD CONSTRAINT Prize_Publication_Prize_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Prize ADD CONSTRAINT Prize_Funding_Prize_fk
FOREIGN KEY (PrizeId)
REFERENCES Prize (PrizeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE MediumTitle ADD CONSTRAINT Medium_MediumTitle_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE MediumDescription ADD CONSTRAINT Medium_MediumDescription_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE MediumKeywords ADD CONSTRAINT Medium_MediumKeywords_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Medium ADD CONSTRAINT Medium_OrgUnit_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Medium ADD CONSTRAINT Medium_Person_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Medium ADD CONSTRAINT Medium_Project_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Medium ADD CONSTRAINT Medium_Publication_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Medium ADD CONSTRAINT Medium_Event_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Medium ADD CONSTRAINT Medium_Product_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Medium_Funding ADD CONSTRAINT Medium_Medium_Funding_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Medium_Classification ADD CONSTRAINT Medium_Medium_MediumClassification_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Medium ADD CONSTRAINT Medium_Patent_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Medium ADD CONSTRAINT Medium_Equipment_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Medium ADD CONSTRAINT Medium_Service_Medium_fk
FOREIGN KEY (MediumId)
REFERENCES Medium (MediumId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CurrencyName ADD CONSTRAINT Currency_CurrencyName_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding ADD CONSTRAINT Currency_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Funding ADD CONSTRAINT Currency_OrgUnit_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Funding ADD CONSTRAINT Currency_Person_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Funding ADD CONSTRAINT Currency_Project_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Funding ADD CONSTRAINT Currency_Patent_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Funding ADD CONSTRAINT Currency_Publication_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Funding ADD CONSTRAINT Currency_Product_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Product ADD CONSTRAINT Currency_OrgUnit_Product_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Product ADD CONSTRAINT Currency_Person_Product_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Funding ADD CONSTRAINT Currency_Event_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Medium_Funding ADD CONSTRAINT Currency_Medium_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Funding ADD CONSTRAINT Currency_Equipment_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Funding ADD CONSTRAINT Currency_Service_Funding_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Prize ADD CONSTRAINT Currency_Funding_Prize_fk
FOREIGN KEY (CurrencyId)
REFERENCES Currency (CurrencyId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Funding ADD CONSTRAINT Funding_Funding_Funding_fk
FOREIGN KEY (FundingId1)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Funding ADD CONSTRAINT Funding_Funding_Funding_fk1
FOREIGN KEY (FundingId2)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Classification ADD CONSTRAINT Funding_Funding_FundingClassification_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Funding ADD CONSTRAINT Funding_OrgUnit_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Funding ADD CONSTRAINT Funding_Person_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Funding ADD CONSTRAINT Funding_Project_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Funding ADD CONSTRAINT Funding_Patent_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FundingName ADD CONSTRAINT Funding_FundingName_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FundingDescription ADD CONSTRAINT Funding_FundingDescription_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FundingKeywords ADD CONSTRAINT Funding_FundingKeywords_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Funding ADD CONSTRAINT Funding_Publication_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Funding ADD CONSTRAINT Funding_Product_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Funding ADD CONSTRAINT Funding_Event_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Medium_Funding ADD CONSTRAINT Funding_Medium_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Funding ADD CONSTRAINT Funding_Equipment_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Funding ADD CONSTRAINT Funding_Service_Funding_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Prize ADD CONSTRAINT Funding_Funding_Prize_fk
FOREIGN KEY (FundingId)
REFERENCES Funding (FundingId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProjectTitle ADD CONSTRAINT Project_ProjectTitle_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProjectAbstract ADD CONSTRAINT Project_ProjectAbstract_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProjectKeywords ADD CONSTRAINT Project_ProjectKeywords_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Project ADD CONSTRAINT Project_Project_Project_fk
FOREIGN KEY (ProjectId1)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Project ADD CONSTRAINT Project_Project_Project_fk1
FOREIGN KEY (ProjectId2)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Classification ADD CONSTRAINT Project_ProjectClassification_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_OrgUnit ADD CONSTRAINT Project_Project_OrgUnit_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Person ADD CONSTRAINT Project_Project_Person_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Publication ADD CONSTRAINT Project_Project_Publication_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Patent ADD CONSTRAINT Project_Project_Patent_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Product ADD CONSTRAINT Project_Project_Product_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Funding ADD CONSTRAINT Project_Project_Funding_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Event ADD CONSTRAINT Project_Project_Event_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Medium ADD CONSTRAINT Project_Project_Medium_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Prize ADD CONSTRAINT Project_Project_Prize_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Equipment ADD CONSTRAINT Project_Project_Equipment_fk
FOREIGN KEY (ProjectId)
REFERENCES Project (ProjectId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Classification_Language ADD CONSTRAINT Classification_Classification_Language_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EAddressType ADD CONSTRAINT Classification_EAddressType_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Classification ADD CONSTRAINT Classification_ProjectClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Classification_ClassificationScheme ADD CONSTRAINT Classification_Classification_ClassificationScheme_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Identifier ADD CONSTRAINT Classification_Identifier_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Identifier_Classification ADD CONSTRAINT Classification_Identifier_Class_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PersonName ADD CONSTRAINT Classification_PersonName_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_EAddress ADD CONSTRAINT Classification_Person_EAddress_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Person ADD CONSTRAINT Classification_Person_Person_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Language ADD CONSTRAINT Classification_Person_Language_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Publication ADD CONSTRAINT Classification_Person_Publication_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_OrgUnit ADD CONSTRAINT Classification_Person_OrgUnit_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Person ADD CONSTRAINT Classification_Project_Person_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Event ADD CONSTRAINT Classification_Person_Event_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Patent ADD CONSTRAINT Classification_Person_Patent_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Product ADD CONSTRAINT Classification_Person_Product_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Funding ADD CONSTRAINT Classification_Person_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_CV ADD CONSTRAINT Classification_Person_CV_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CV_CVClassification ADD CONSTRAINT Classification_CV_CVClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_OrgUnit ADD CONSTRAINT Classification_Project_OrgUnit_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_OrgUnit ADD CONSTRAINT Classification_OrgUnit_OrgUnit_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Classification ADD CONSTRAINT Classification_OrgUnit_OrgUnitClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Publication ADD CONSTRAINT Classification_OrgUnit_Publication_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Funding ADD CONSTRAINT Classification_OrgUnit_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Patent ADD CONSTRAINT Classification_OrgUnit_Patent_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Product ADD CONSTRAINT Classification_OrgUnit_Product_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Funding ADD CONSTRAINT Classification_Project_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Product ADD CONSTRAINT Classification_Project_Product_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Patent ADD CONSTRAINT Classification_Project_Patent_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Publication ADD CONSTRAINT Classification_Project_Publication_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Project ADD CONSTRAINT Classification_Project_Project_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Qualification ADD CONSTRAINT Classification_Person_Qualification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Qualification_Classification ADD CONSTRAINT Classification_Qualification_Classification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_ExpSkills ADD CONSTRAINT Classification_OrgUnit_ExpSkills_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_ExpSkills ADD CONSTRAINT Classification_Person_ExpSkills_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkills_Classification ADD CONSTRAINT Classification_ExpSkills_ExpSkillsClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Classification ADD CONSTRAINT Classification_Funding_FundingClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Funding ADD CONSTRAINT Classification_Funding_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Medium ADD CONSTRAINT Classification_OrgUnit_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Medium ADD CONSTRAINT Classification_Person_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Medium ADD CONSTRAINT Classification_Project_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Medium ADD CONSTRAINT Classification_Publication_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Medium ADD CONSTRAINT Classification_Patent_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Medium ADD CONSTRAINT Classification_Product_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Medium_Funding ADD CONSTRAINT Classification_Medium_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Medium_Classification ADD CONSTRAINT Classification_Medium_MediumClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Citation ADD CONSTRAINT Classification_Publication_Citation_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Citation_Classification ADD CONSTRAINT Classification_Citation_CitationClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Classification ADD CONSTRAINT Classification_Publication_PublicationType_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Publication ADD CONSTRAINT Classification_Publication_Publication_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Patent ADD CONSTRAINT Classification_Publication_Patent_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Funding ADD CONSTRAINT Classification_Publication_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Product ADD CONSTRAINT Classification_Publication_Product_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Funding ADD CONSTRAINT Classification_Event_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Event ADD CONSTRAINT Classification_OrgUnit_Event_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Classification ADD CONSTRAINT Classification_Event_EventClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Event ADD CONSTRAINT Classification_Event_Event_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Event ADD CONSTRAINT Classification_Publication_Event_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Event ADD CONSTRAINT Classification_Project_Event_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Medium ADD CONSTRAINT Classification_Event_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Classification ADD CONSTRAINT Classification_Equipment_Classification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Equipment ADD CONSTRAINT Classification_OrgUnit_Equipment_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Equipment ADD CONSTRAINT Classification_Project_Equipment_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Equipment ADD CONSTRAINT Classification_Product_Equipment_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Equipment ADD CONSTRAINT Classification_Equipment_Equipment_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Funding ADD CONSTRAINT Classification_Equipment_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Medium ADD CONSTRAINT Classification_Equipment_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Classification ADD CONSTRAINT Classification_Product_Classification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Product ADD CONSTRAINT Classification_Product_Product_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Funding ADD CONSTRAINT Classification_Product_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Patent ADD CONSTRAINT Classification_Product_Patent_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Patent ADD CONSTRAINT Classification_Patent_Patent_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Classification ADD CONSTRAINT Classification_Patent_PatentClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Funding ADD CONSTRAINT Classification_Patent_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Prize_Classification ADD CONSTRAINT Classification_Prize_PrizeClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Prize ADD CONSTRAINT Classification_Project_Prize_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Prize ADD CONSTRAINT Classification_Publication_Prize_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Prize ADD CONSTRAINT Classification_Person_Prize_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Prize ADD CONSTRAINT Classification_OrgUnit_Prize_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Funding_Prize ADD CONSTRAINT Classification_Funding_Prize_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Classification ADD CONSTRAINT Classification_Service_ServiceClassification_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Service ADD CONSTRAINT Classification_Service_Service_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Service ADD CONSTRAINT Classification_OrgUnit_Service_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Service ADD CONSTRAINT Classification_Person_Service_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Service ADD CONSTRAINT Classification_Product_Service_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Medium ADD CONSTRAINT Classification_Service_Medium_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Service_Funding ADD CONSTRAINT Classification_Service_Funding_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Equipment_Service ADD CONSTRAINT Classification_Equipment_Service_fk
FOREIGN KEY (ClassificationId)
REFERENCES Classification (ClassificationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PAddress ADD CONSTRAINT Country_PAddress_fk
FOREIGN KEY (CountryId)
REFERENCES Country (CountryId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent ADD CONSTRAINT Country_Patent_fk
FOREIGN KEY (CountryId)
REFERENCES Country (CountryId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event ADD CONSTRAINT Country_Event_fk
FOREIGN KEY (CountryId)
REFERENCES Country (CountryId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Classification ADD CONSTRAINT Event_Event_EventClassification_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Event ADD CONSTRAINT Event_Event_Event_fk
FOREIGN KEY (EventId1)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Event ADD CONSTRAINT Event_Event_Event_fk1
FOREIGN KEY (EventId2)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Funding ADD CONSTRAINT Event_Event_Funding_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EventDescription ADD CONSTRAINT Event_EventDescription_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EventKeywords ADD CONSTRAINT Event_EventKeywords_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EventName ADD CONSTRAINT Event_EventName_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Event ADD CONSTRAINT Event_Publication_Event_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Event ADD CONSTRAINT Event_OrgUnit_Event_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Event ADD CONSTRAINT Event_Person_Event_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Event ADD CONSTRAINT Event_Project_Event_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Event_Medium ADD CONSTRAINT Event_Event_Medium_fk
FOREIGN KEY (EventId)
REFERENCES Event (EventId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentTitle ADD CONSTRAINT Patent_PatentTitle_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentAbstract ADD CONSTRAINT Patent_PatentAbstract_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentKeywords ADD CONSTRAINT Patent_PatentKeywords_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentVersion ADD CONSTRAINT Patent_PatentVersion_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Classification ADD CONSTRAINT Patent_Patent_PatentClassification_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Patent ADD CONSTRAINT Patent_Patent_Patent_fk
FOREIGN KEY (PatentId1)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Patent ADD CONSTRAINT Patent_Patent_Patent_fk1
FOREIGN KEY (PatentId2)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Patent ADD CONSTRAINT Patent_OrgUnit_Patent_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Patent ADD CONSTRAINT Patent_Project_Patent_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Patent ADD CONSTRAINT Patent_Person_Patent_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Patent ADD CONSTRAINT Patent_Publication_Patent_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Patent ADD CONSTRAINT Patent_Product_Patent_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Funding ADD CONSTRAINT Patent_Patent_Funding_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Patent_Medium ADD CONSTRAINT Patent_Patent_Medium_fk
FOREIGN KEY (PatentId)
REFERENCES Patent (PatentId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_PAddress ADD CONSTRAINT PAddress_Person_PAddress_fk
FOREIGN KEY (PAddressId)
REFERENCES PAddress (PAddressId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_PAddress ADD CONSTRAINT PAddress_OrgUnit_PAddress_fk
FOREIGN KEY (PAddressId)
REFERENCES PAddress (PAddressId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EAddress ADD CONSTRAINT EAddressType_EAddress_fk
FOREIGN KEY (EAddressTypeId)
REFERENCES EAddressType (EAddressTypeId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_EAddress ADD CONSTRAINT EAddress_Person_EAddress_fk
FOREIGN KEY (EAddressId)
REFERENCES EAddress (EAddressId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Identifier ADD CONSTRAINT Identifier_Person_Identifier_fk
FOREIGN KEY (IdentifierId)
REFERENCES Identifier (IdentifierId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Identifier ADD CONSTRAINT Identifier_OrgUnit_Identifier_fk
FOREIGN KEY (IdentifierId)
REFERENCES Identifier (IdentifierId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Identifier_Classification ADD CONSTRAINT Identifier_Identifier_Class_fk
FOREIGN KEY (IdentifierId)
REFERENCES Identifier (IdentifierId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Identifier ADD CONSTRAINT Identifier_Product_Identifier_fk
FOREIGN KEY (IdentifierId)
REFERENCES Identifier (IdentifierId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Identifier ADD CONSTRAINT Identifier_Publication_Identifier_fk
FOREIGN KEY (IdentifierId)
REFERENCES Identifier (IdentifierId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Gender_Language ADD CONSTRAINT Gender_Gender_Lang_fk
FOREIGN KEY (GenderId)
REFERENCES PersonGender (GenderId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person ADD CONSTRAINT Gender_Person_fk
FOREIGN KEY (GenderId)
REFERENCES PersonGender (GenderId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PersonName ADD CONSTRAINT Person_PersonName_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Identifier ADD CONSTRAINT Person_Person_Identifier_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_PAddress ADD CONSTRAINT Person_Person_PAddress_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_EAddress ADD CONSTRAINT Person_Person_EAddress_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PersonKeywords ADD CONSTRAINT Person_PersonKeywords_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PersonResearchInterests ADD CONSTRAINT Person_PersonResearchInterests_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_OrgUnit ADD CONSTRAINT Person_Person_OrgUnit_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Person ADD CONSTRAINT Person_Person_Person_fk
FOREIGN KEY (PersonID1)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Person ADD CONSTRAINT Person_Person_Person_fk1
FOREIGN KEY (PersonID2)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Person ADD CONSTRAINT Person_Project_Person_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Publication ADD CONSTRAINT Person_Person_Publication_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Patent ADD CONSTRAINT Person_Person_Patent_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Product ADD CONSTRAINT Person_Person_Product_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Funding ADD CONSTRAINT Person_Person_Funding_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Event ADD CONSTRAINT Person_Person_Event_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Medium ADD CONSTRAINT Person_Person_Medium_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Prize ADD CONSTRAINT Person_Person_Prize_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Service ADD CONSTRAINT Person_Person_Service_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Qualification ADD CONSTRAINT Person_Person_Qualification_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_ExpSkills ADD CONSTRAINT Person_Person_ExpSkills_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_CV ADD CONSTRAINT Person_Person_CV_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Language ADD CONSTRAINT Person_Person_Language_fk
FOREIGN KEY (PersonID)
REFERENCES Person (PersonID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Publication ADD CONSTRAINT PersonName_Person_Publication_fk
FOREIGN KEY (PersonNameId)
REFERENCES PersonName (PersonNameId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnitName ADD CONSTRAINT Lang_OrgUnit_Lang_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnitActivity ADD CONSTRAINT Lang_OrgUnitActivity_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnitKeywords ADD CONSTRAINT Lang_OrgUnitKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Gender_Language ADD CONSTRAINT Lang_Gender_Lang_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PersonKeywords ADD CONSTRAINT Lang_PersonKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PersonResearchInterests ADD CONSTRAINT Lang_PersonResearchInterests_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Classification_Language ADD CONSTRAINT Language_Classification_Language_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProjectTitle ADD CONSTRAINT Language_ProjectTitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProjectAbstract ADD CONSTRAINT Language_ProjectAbstract_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProjectKeywords ADD CONSTRAINT Language_ProjectKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationTitle ADD CONSTRAINT Language_PublicationTitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationSubtitle ADD CONSTRAINT Language_PublicationSubtitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationAbstract ADD CONSTRAINT Language_PublicationAbstract_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationKeywords ADD CONSTRAINT Language_PublicationKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationVersion ADD CONSTRAINT Language_PublicationVersion_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentTitle ADD CONSTRAINT Language_PatentTitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentAbstract ADD CONSTRAINT Language_PatentAbstract_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentKeywords ADD CONSTRAINT Language_PatentKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PatentVersion ADD CONSTRAINT Language_PatentVersion_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductName ADD CONSTRAINT Language_ProductName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductAltName ADD CONSTRAINT Language_ProductAltName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductDescription ADD CONSTRAINT Language_ProductDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductKeywords ADD CONSTRAINT Language_ProductKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductVersion ADD CONSTRAINT Language_ProductVersion_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CurrencyName ADD CONSTRAINT Language_CurrencyName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FundingName ADD CONSTRAINT Language_FundingName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FundingKeywords ADD CONSTRAINT Language_FundingKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FundingDescription ADD CONSTRAINT Language_FundingDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EventDescription ADD CONSTRAINT Language_EventDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EventName ADD CONSTRAINT Language_EventName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EventKeywords ADD CONSTRAINT Language_EventKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE MediumTitle ADD CONSTRAINT Language_MediumTitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE MediumDescription ADD CONSTRAINT Language_MediumDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE MediumKeywords ADD CONSTRAINT Language_MediumKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PrizeName ADD CONSTRAINT Language_PrizeName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PrizeDescription ADD CONSTRAINT Language_PrizeDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PrizeKeywords ADD CONSTRAINT Language_PrizeKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EquipmentName ADD CONSTRAINT Language_EquipmentName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EquipmentDescription ADD CONSTRAINT Language_EquipmentDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE EquipmentKeywords ADD CONSTRAINT Language_EquipmentKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ServiceName ADD CONSTRAINT Language_ServiceName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ServiceDescription ADD CONSTRAINT Language_ServiceDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ServiceKeywords ADD CONSTRAINT Language_ServiceKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE QualificationDescription ADD CONSTRAINT Language_QualificationDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE QualificationKeywords ADD CONSTRAINT Language_QualificationKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE QualificationTitle ADD CONSTRAINT Language_QualificationTitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkillsName ADD CONSTRAINT Language_ExpSkillsName_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkillsDescription ADD CONSTRAINT Language_ExpSkillsDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ExpSkillsKeywords ADD CONSTRAINT Language_ExpSkillsKeywords_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CitationTitle ADD CONSTRAINT Language_CitationTitle_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE CitationDescription ADD CONSTRAINT Language_CitationDescription_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Language ADD CONSTRAINT Language_Person_Language_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication ADD CONSTRAINT Language_Publication_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product ADD CONSTRAINT Language_Product_fk
FOREIGN KEY (LanguageId)
REFERENCES Language (LanguageId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductName ADD CONSTRAINT Product_ProductName_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductAltName ADD CONSTRAINT Product_ProductAltName_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductDescription ADD CONSTRAINT Product_ProductDescription_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductKeywords ADD CONSTRAINT Product_ProductKeywords_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE ProductVersion ADD CONSTRAINT Product_ProductVersion_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Product ADD CONSTRAINT Product_Product_Product_fk
FOREIGN KEY (ProductId1)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Product ADD CONSTRAINT Product_Product_Product_fk1
FOREIGN KEY (ProductId2)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Classification ADD CONSTRAINT Product_Product_ProductClassification_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Product ADD CONSTRAINT Product_OrgUnit_Product_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Patent ADD CONSTRAINT Product_Product_Patent_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Product ADD CONSTRAINT Product_Person_Product_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Product ADD CONSTRAINT Product_Project_Product_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Product ADD CONSTRAINT Product_Publication_Product_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Funding ADD CONSTRAINT Product_Product_Funding_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Medium ADD CONSTRAINT Product_Product_Medium_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Equipment ADD CONSTRAINT Product_Product_Equipment_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Service ADD CONSTRAINT Product_Product_Service_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_Identifier ADD CONSTRAINT Product_Product_Identifier_fk
FOREIGN KEY (ProductId)
REFERENCES Product (ProductId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationDetail ADD CONSTRAINT Publication_PublicationDetail_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationTitle ADD CONSTRAINT Publication_PublicationTitle_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationSubtitle ADD CONSTRAINT Publication_PublicationSubtitle_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationAbstract ADD CONSTRAINT Publication_PublicationAbstract_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationKeywords ADD CONSTRAINT Publication_PublicationKeywords_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PublicationVersion ADD CONSTRAINT Publication_PublicationVersion_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Classification ADD CONSTRAINT Publication_Publication_PublicationType_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Publication ADD CONSTRAINT Publication_Publication_Publication_fk
FOREIGN KEY (PublicationId1)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Publication ADD CONSTRAINT Publication_Publication_Publication_fk1
FOREIGN KEY (PublicationId2)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Publication ADD CONSTRAINT Publication_OrgUnit_Publication_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_Publication ADD CONSTRAINT Publication_Person_Publication_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_Publication ADD CONSTRAINT Publication_Project_Publication_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Patent ADD CONSTRAINT Publication_Publication_Patent_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Product ADD CONSTRAINT Publication_Publication_Product_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Funding ADD CONSTRAINT Publication_Publication_Funding_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Event ADD CONSTRAINT Publication_Publication_Event_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Medium ADD CONSTRAINT Publication_Publication_Medium_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Citation ADD CONSTRAINT Publication_Publication_Citation_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Prize ADD CONSTRAINT Publication_Publication_Prize_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Publication_Identifier ADD CONSTRAINT Publication_Publication_Identifier_fk
FOREIGN KEY (PublicationId)
REFERENCES Publication (PublicationId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnitName ADD CONSTRAINT OrgUnit_OrgUnit_Lang_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_OrgUnit ADD CONSTRAINT OrgUnit_OrgUnit_OrgUnit_fk
FOREIGN KEY (OrgUnitId1)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_OrgUnit ADD CONSTRAINT OrgUnit_OrgUnit_OrgUnit_fk1
FOREIGN KEY (OrgUnitId2)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnitActivity ADD CONSTRAINT OrgUnit_OrgUnitActivity_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnitKeywords ADD CONSTRAINT OrgUnit_OrgUnitKeywords_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_PAddress ADD CONSTRAINT OrgUnit_OrgUnit_PAddress_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Person_OrgUnit ADD CONSTRAINT OrgUnit_Person_OrgUnit_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Project_OrgUnit ADD CONSTRAINT OrgUnit_Project_OrgUnit_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Publication ADD CONSTRAINT OrgUnit_OrgUnit_Publication_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Patent ADD CONSTRAINT OrgUnit_OrgUnit_Patent_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Product ADD CONSTRAINT OrgUnit_OrgUnit_Product_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Funding ADD CONSTRAINT OrgUnit_OrgUnit_Funding_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Identifier ADD CONSTRAINT OrgUnit_OrgUnit_Identifier_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Event ADD CONSTRAINT OrgUnit_OrgUnit_Event_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Medium ADD CONSTRAINT OrgUnit_OrgUnit_Medium_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Prize ADD CONSTRAINT OrgUnit_OrgUnit_Prize_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Equipment ADD CONSTRAINT OrgUnit_OrgUnit_Equipment_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Service ADD CONSTRAINT OrgUnit_OrgUnit_Service_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_ExpSkills ADD CONSTRAINT OrgUnit_OrgUnit_ExpSkills_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE OrgUnit_Classification ADD CONSTRAINT OrgUnit_OrgUnit_OrgUnitClassification_fk
FOREIGN KEY (OrgUnitId)
REFERENCES OrgUnit (OrgUnitId)
ON DELETE NO ACTION
ON UPDATE NO ACTION