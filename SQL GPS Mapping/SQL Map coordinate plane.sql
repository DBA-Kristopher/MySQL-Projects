
Create database iLab4;
use iLab4;
 drop table Points;
Create Table Points (name varchar(20) not null,id varchar(20), Latitude Float(20), Longitude Float(20), description varchar(200),primary key(name), index Iname(name))
engine=MyISAM;

INSERT INTO Points (name, id, Latitude, Longitude) VALUES ( 'point1' ,1,34.1, -118.5 );
INSERT INTO Points (name, id, Latitude, Longitude) VALUES ( 'point2' ,2,36.7, -125.9 );
INSERT INTO Points (name, id, Latitude, Longitude) VALUES ( 'point3' ,3,50.3, -111.7 );

select * from Points;
select Astext(location) from points;
select name, Astext(location) from points;


SELECT a.name AS from_name, b.name AS to_name, 
   111.1111 *
    DEGREES(ACOS(COS(RADIANS(a.Latitude))
         * COS(RADIANS(b.Latitude))
         * COS(RADIANS(a.Longitude - b.Longitude))
         + SIN(RADIANS(a.Latitude))
         * SIN(RADIANS(b.Latitude)))) AS distance_in_km
  FROM Points AS a
  JOIN Points AS b ON a.id <> b.id
 WHERE a.name = 'point2' AND b.name = 'point3'; 
select ST_Distance(' POINT(25.6 -111.5) ',' POINT(37.5 -124.7) ') from Points;

Select Concat('https://www.google.com/maps/dir/',@lat,'+',@lon,'/',@latt,'+',@lonn) as ULR;
select concat(@lat,'+',@lonn,'/');
select @lat as X, @lon as y;
set @lat= 34.297106;
set @lon = -119.164864;
set @latt =34.279759 ;
set @lonn = -119.191578;
set @dist = 10;
set @rlon1 = @lon-@dist/abs(cos(radians(@lat))*69);
set @rlon2 = @lon+@dist/abs(cos(radians(@lat))*69);
set @rlat1 = @lat-(@dist/69);
set @rlat2 = @lat+(@dist/69);

select envelope(linestring(point(@rlon1, @rlat1), point(@rlon2, @rlat2)));
Show tables;
select * from client;

DELIMITER $$
Create Procedure MapBorder()
BEGIN
set @lat= 37.615223;
set @lon = -122.389979;
set @dist = 10;
set @rlon1 = @lon-@dist/abs(cos(radians(@lat))*69);
set @rlon2 = @lon+@dist/abs(cos(radians(@lat))*69);
set @rlat1 = @lat-(@dist/69);
set @rlat2 = @lat+(@dist/69);

select astext(envelope(linestring(point(@rlon1, @rlat1), point(@rlon2, @rlat2))));

END