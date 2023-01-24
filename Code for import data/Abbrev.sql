DROP table IF EXISTS abbrev;
create table abbrev(
 # id INT NOT NULL auto_increment,
  Type varchar(255) ,
  Code varchar(255) ,
  Fullname varchar(255) 
);

insert into abbrev values ( "Playoffs" ,"NHAF" ,"Lost NHA finals");
insert into abbrev values ( "Playoffs" ,"NHLF" ,"Lost NHL finals");
insert into abbrev values ( "Playoffs" ,"CQF" ,"Lost NHL conference quarter-finals");
insert into abbrev values ( "Playoffs" ,"PRE" ,"Lost NHL preliminary round");
insert into abbrev values ( "Playoffs" ,"F" ,"Lost Stanley Cup finals");
insert into abbrev values ( "Playoffs" ,"CSF" ,"Lost NHL conference semi-finals");
insert into abbrev values ( "Playoffs" ,"CF" ,"Lost NHL conference finals");
insert into abbrev values ( "Playoffs" ,"SC" ,"Won Stanley Cup");
insert into abbrev values ( "Playoffs" ,"DF" ,"Lost NHL division finals");
insert into abbrev values ( "Playoffs" ,"QF" ,"Lost NHL quarter-finals");
insert into abbrev values ( "Playoffs" ,"SF" ,"Lost NHL semi-finals");
insert into abbrev values ( "Playoffs" ,"DSF" ,"Lost NHL division semi-finals");
insert into abbrev values ( "Playoffs" ,"ND" ,"ND - Stanley Cup finals halted (influenza epidemic)");
insert into abbrev values ( "Playoffs" ,"AVC" ,"Won AVCO Cup");
insert into abbrev values ( "Playoffs" ,"AVF" ,"Lost AVCO Cup finals");
insert into abbrev values ( "Playoffs" ,"AVSF" ,"Lost AVCO Cup semi-finals");
insert into abbrev values ( "Playoffs" ,"AVQF" ,"Lost AVCO Cup quarter-finals");
insert into abbrev values ( "Playoffs" ,"AVPRE" ,"Lost AVCO Cup preliminary round");
insert into abbrev values ( "Playoffs" ,"WSF" ,"Lost WCHL semi-finals");
insert into abbrev values ( "Playoffs" ,"WF" ,"Lost WCHL finals");
insert into abbrev values ( "Playoffs" ,"PF" ,"Lost PCHA finals");
insert into abbrev values ( "Playoffs" ,"SCSF" ,"Lost Stanley Cup semi-finals");
insert into abbrev values ( "Playoffs" ,"WCS" ,"Won Challenge Series");
insert into abbrev values ( "Playoffs" ,"LCS" ,"Won Stanley Cup / Lost Challenge Series");
insert into abbrev values ( "Conference" ,"CC" ,"Campbell Conference");
insert into abbrev values ( "Conference" ,"WA" ,"Wales Conference");
insert into abbrev values ( "Conference" ,"EC" ,"Eastern Conference");
insert into abbrev values ( "Conference" ,"WC" ,"Western Conference");
insert into abbrev values ( "Division" ,"AM" ,"American Division");
insert into abbrev values ( "Division" ,"CA" ,"Canadian Division");
insert into abbrev values ( "Division" ,"ED" ,"East Division");
insert into abbrev values ( "Division" ,"WD" ,"West Division");
insert into abbrev values ( "Division" ,"PT" ,"Patrick Division");
insert into abbrev values ( "Division" ,"AD" ,"Adams Division");
insert into abbrev values ( "Division" ,"NO" ,"Norris Division");
insert into abbrev values ( "Division" ,"SM" ,"Smythe Division");
insert into abbrev values ( "Division" ,"AT" ,"Atlantic Division");
insert into abbrev values ( "Division" ,"NE" ,"Northeast Division");
insert into abbrev values ( "Division" ,"SE" ,"Southeast Division");
insert into abbrev values ( "Division" ,"CE" ,"Central Division");
insert into abbrev values ( "Division" ,"NW" ,"Northwest Division");
insert into abbrev values ( "Division" ,"PC" ,"Pacific Division");
insert into abbrev values ( "Division" ,"EW" ,"WHA East Division");
insert into abbrev values ( "Division" ,"WW" ,"WHA West Division");
insert into abbrev values ( "Division" ,"CW" ,"WHA Canadian Division");
insert into abbrev values ( "Round" ,"QF" ,"Quarter-Finals");
insert into abbrev values ( "Round" ,"SF" ,"Semi-Finals");
insert into abbrev values ( "Round" ,"F" ,"Finals");
insert into abbrev values ( "Round" ,"WP" ,"Western Playoff");
insert into abbrev values ( "Round" ,"SCF" ,"Stanley Cup Finals");
insert into abbrev values ( "Round" ,"SCSF" ,"Stanley Cup Semi-Finals");
insert into abbrev values ( "Round" ,"Pre" ,"Preliminary");
insert into abbrev values ( "Round" ,"DSF" ,"Division Semi-Finals");
insert into abbrev values ( "Round" ,"DF" ,"Division Finals");
insert into abbrev values ( "Round" ,"CQF" ,"Conference Quarter-Finals");
insert into abbrev values ( "Round" ,"CSF" ,"Conference Semi-Finals");
insert into abbrev values ( "Round" ,"CF" ,"Conference Finals");
insert into abbrev values ( "Round" ,"ACF" ,"Avco Cup Finals");