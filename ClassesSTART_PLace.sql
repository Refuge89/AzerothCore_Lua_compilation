SET
@MAP := 'PUT MAP ID HERE',
@ZONE := 'PUT ZONE ID HERE',
@X := 'PUT COORDINATES X HERE',
@Y := 'PUT COORDINATES Y HERE',
@Z := 'PUT COORDINATES Z HERE',
@O := 'PUT ORIENTATION HERE';

UPDATE playercreateinfo SET map=@MAP, zone=@ZONE, position_X=@X, position_Y=@Y, position_Z=@Z, orientation=@O WHERE race IN(1, 2, 3, 4, 5, 6, 7, 8, 10, 11);