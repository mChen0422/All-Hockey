DROP table IF EXISTS CombinedShutouts;
create table CombinedShutouts(
 # id INT NOT NULL auto_increment,
  Cyear varchar(255) ,
  Cmonth varchar(255) ,
  Cdate varchar(255)  ,
  tmID varchar(255) ,
  oppID varchar(255) ,
  R_P varchar(255) ,
  IDgoalie1 varchar(255) ,
  IDgoalie2 varchar(255) 
);

insert into CombinedShutouts values ( "1929" ,"3" ,"14" ,"TOR" ,"NYA" ,"R" ,"chabolo01" ,"grantbe01");
insert into CombinedShutouts values ( "1941" ,"3" ,"15" ,"MTL" ,"NYA" ,"R" ,"bibeapa01" ,"gardibe01");
insert into CombinedShutouts values ( "1955" ,"3" ,"22" ,"MTL" ,"BOS" ,"P" ,"plantja01" ,"hodgech01");
insert into CombinedShutouts values ( "1968" ,"2" ,"14" ,"OAK" ,"PHI" ,"R" ,"smithga01" ,"hodgech01");
insert into CombinedShutouts values ( "1970" ,"11" ,"5" ,"STL" ,"BOS" ,"R" ,"hallgl01" ,"wakeler01");
insert into CombinedShutouts values ( "1971" ,"1" ,"2" ,"TOR" ,"DET" ,"R" ,"plantja01" ,"gamblbr01");
insert into CombinedShutouts values ( "1971" ,"3" ,"24" ,"TOR" ,"CLF" ,"R" ,"plantja01" ,"parenbe01");
insert into CombinedShutouts values ( "1972" ,"11" ,"25" ,"TOR" ,"CLF" ,"R" ,"plantja01" ,"lowro01");
insert into CombinedShutouts values ( "1972" ,"12" ,"29" ,"TOR" ,"PIT" ,"R" ,"plantja01" ,"lowro01");
insert into CombinedShutouts values ( "1973" ,"2" ,"7" ,"QUN" ,"PHB" ,"R" ,"aubryse01" ,"broderi01");
insert into CombinedShutouts values ( "1973" ,"10" ,"16" ,"TOT" ,"LAS" ,"R" ,"binklle01" ,"grattgi01");
insert into CombinedShutouts values ( "1975" ,"2" ,"23" ,"CHI" ,"ATF" ,"R" ,"esposto01" ,"dumasmi01");
insert into CombinedShutouts values ( "1977" ,"3" ,"18" ,"WAS" ,"COR" ,"R" ,"croziro01" ,"lowro01");
insert into CombinedShutouts values ( "1977" ,"11" ,"1" ,"NYI" ,"ATF" ,"R" ,"smithbi01" ,"hogosgo01");
insert into CombinedShutouts values ( "1980" ,"2" ,"20" ,"LAK" ,"BOS" ,"R" ,"lessama01" ,"keansdo01");
insert into CombinedShutouts values ( "1981" ,"2" ,"5" ,"MTL" ,"MNS" ,"R" ,"herrode01" ,"sevigri01");
insert into CombinedShutouts values ( "1981" ,"11" ,"11" ,"MTL" ,"COR" ,"R" ,"herrode01" ,"sevigri01");
insert into CombinedShutouts values ( "1983" ,"4" ,"3" ,"WAS" ,"NYR" ,"R" ,"jenseal01" ,"riggipa01");
insert into CombinedShutouts values ( "1983" ,"12" ,"4" ,"NJD" ,"DET" ,"R" ,"lowro01" ,"reschgl01");
insert into CombinedShutouts values ( "1985" ,"1" ,"8" ,"EDM" ,"QUE" ,"R" ,"moogan01" ,"fuhrgr01");
insert into CombinedShutouts values ( "1987" ,"1" ,"9" ,"WIN" ,"HAR" ,"R" ,"reddipo01" ,"berthda01");
insert into CombinedShutouts values ( "1987" ,"1" ,"23" ,"PIT" ,"VAN" ,"R" ,"melocgi01" ,"romanro01");
insert into CombinedShutouts values ( "1991" ,"10" ,"25" ,"DET" ,"TOR" ,"R" ,"riendvi01" ,"cheveti01");
insert into CombinedShutouts values ( "1993" ,"2" ,"8" ,"PIT" ,"BOS" ,"R" ,"wreggke01" ,"barrato01");
insert into CombinedShutouts values ( "1996" ,"11" ,"9" ,"NJD" ,"NYI" ,"R" ,"brodema01" ,"dunhami01");
insert into CombinedShutouts values ( "1996" ,"12" ,"3" ,"TOR" ,"STL" ,"R" ,"cousima01" ,"potvife01");
insert into CombinedShutouts values ( "1997" ,"10" ,"18" ,"DET" ,"CAR" ,"R" ,"osgooch01" ,"hodsoke01");
insert into CombinedShutouts values ( "1997" ,"11" ,"4" ,"TOR" ,"SJS" ,"R" ,"healygl01" ,"cousima01");
insert into CombinedShutouts values ( "1997" ,"12" ,"31" ,"TBL" ,"NYR" ,"R" ,"schwaco01" ,"wilkide01");
insert into CombinedShutouts values ( "1998" ,"4" ,"4" ,"NYI" ,"NYR" ,"R" ,"saloto01" ,"flahewa01");
insert into CombinedShutouts values ( "1998" ,"4" ,"7" ,"SJS" ,"CAL" ,"R" ,"vernomi01" ,"hrudeke01");
insert into CombinedShutouts values ( "1998" ,"10" ,"28" ,"LAK" ,"NJD" ,"R" ,"fisetst01" ,"legacma01");
insert into CombinedShutouts values ( "1999" ,"1" ,"9" ,"PHI" ,"CAR" ,"R" ,"hextaro01" ,"vanbijo01");
insert into CombinedShutouts values ( "1999" ,"4" ,"8" ,"TBL" ,"BOS" ,"R" ,"schwaco01" ,"hodsoke01");
insert into CombinedShutouts values ( "2000" ,"3" ,"21" ,"BOS" ,"TBL" ,"R" ,"grahajo01" ,"tallaro01");
insert into CombinedShutouts values ( "2001" ,"3" ,"12" ,"SJS" ,"MTL" ,"R" ,"nabokev01" ,"kiprumi01");
insert into CombinedShutouts values ( "2001" ,"10" ,"27" ,"DET" ,"NAS" ,"R" ,"hasekdo01" ,"legacma01");
insert into CombinedShutouts values ( "2001" ,"11" ,"15" ,"PHI" ,"WAS" ,"R" ,"bouchbr01" ,"cechmro01");
insert into CombinedShutouts values ( "2001" ,"11" ,"17" ,"CAL" ,"STL" ,"R" ,"vernomi01" ,"turekro01");
insert into CombinedShutouts values ( "2001" ,"12" ,"8" ,"ANA" ,"CAL" ,"R" ,"shielst01" ,"gigueje01");
insert into CombinedShutouts values ( "2002" ,"1" ,"10" ,"BOS" ,"LAK" ,"R" ,"grahajo01" ,"dafoeby01");
insert into CombinedShutouts values ( "2003" ,"11" ,"21" ,"SJS" ,"PHO" ,"R" ,"nabokev01" ,"toskave01");
insert into CombinedShutouts values ( "2005" ,"10" ,"22" ,"CAR" ,"WAS" ,"R" ,"gerbema01" ,"wardca01");
insert into CombinedShutouts values ( "2005" ,"11" ,"12" ,"ATL" ,"CAR" ,"R" ,"dunhami01" ,"berkhad01");
insert into CombinedShutouts values ( "2005" ,"12" ,"2" ,"SJS" ,"BUF" ,"R" ,"nabokev01" ,"schaeno01");
insert into CombinedShutouts values ( "2006" ,"11" ,"23" ,"NAS" ,"VAN" ,"R" ,"vokouto01" ,"masonch02");
insert into CombinedShutouts values ( "2007" ,"2" ,"8" ,"STL" ,"DET" ,"R" ,"legacma01" ,"sanfocu01");
insert into CombinedShutouts values ( "2007" ,"12" ,"12" ,"OTT" ,"CAR" ,"R" ,"gerbema01" ,"emeryra01");
insert into CombinedShutouts values ( "2008" ,"10" ,"25" ,"STL" ,"FLO" ,"R" ,"bishobe01" ,"schwama01");
insert into CombinedShutouts values ( "2009" ,"12" ,"1" ,"TOR" ,"MTL" ,"R" ,"gustajo01" ,"macdojo01");
insert into CombinedShutouts values ( "2010" ,"5" ,"10" ,"PHI" ,"BOS" ,"P" ,"bouchbr01" ,"leighmi01");
insert into CombinedShutouts values ( "2011" ,"2" ,"2" ,"PIT" ,"NYI" ,"R" ,"johnsbr02" ,"fleurma01");
insert into CombinedShutouts values ( "2011" ,"12" ,"6" ,"VAN" ,"COL" ,"R" ,"luongro01" ,"schneco01");
insert into CombinedShutouts values ( "2012" ,"4" ,"14" ,"STL" ,"SJS" ,"P" ,"halakja01" ,"elliobr01");