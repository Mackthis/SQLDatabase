CREATE TABLE Party (
partyID             integer         not null,
partyName           varchar(32)     not null,
partyDescription    varchar(512),
CONSTRAINT Party_pk PRIMARY KEY (partyID)
);

CREATE TABLE PlayerCharacter (
pcID                integer         not null,
pcDescription       varchar(1024),
CONSTRAINT PlayerCharacter_pk PRIMARY KEY (pcID),
CONSTRAINT PlayerCharacter_fk_PlayableCharacter FOREIGN KEY (pcID)
);

CREATE TABLE Party (
playerID            integer         not null,
playerName          varchar(32)     not null,
CONSTRAINT Player_pk PRIMARY KEY (playerID)
);

CREATE TABLE PlayableCharacter (
pcId                integer         not null,
pcName              varchar(32)     not null,
CONSTRAINT PlayableCharacter_pk PRIMARY KEY (pcID)
);

CREATE TABLE Class (
className           varchar(32)     not null,
source              varchar(5)      not null,
CONSTRAINT Class_SourceIsBookOrHomebrew
    CHECK (source IN
SELECT hbID AS source FROM Homebrew
UNION
SELECT bookAbbr AS source FROM Books )
--TODO
);

CREATE TABLE Homebrew (
hbID                varchar(5)      not null,
hbDescription       varchar(512)    not null,
CONSTRAINT Homebrew_pk PRIMARY KEY (hbID)
);

CREATE TABLE Books (
bookAbbr            varchar(5)      not null,
CONSTRAINT Books_pk PRIMARY KEY (bookAbbr)
);
--Users\SanderB\Documents\UU\INFODB\Practicum